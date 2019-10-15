library(raster)

# Read a raster file
file <- 'MOD_NDVI_M_2017-08-01_rgb_1440x720.TIFF'
rast <- raster(file)

# A simple plot of raster
plot(rast)

# Define a extent
ext <- drawExtent()

# Crop the raster
rast.crop <- crop(rast, ext)
plot(rast.crop)

# Select a CRS
library(rgdal)
crs <- make_EPSG()
crs <- crs$prj4[which(crs$code == '2163')]
crs <- CRS(crs)

# Can you trasnform 
rast.proj <- projectRaster(rast.crop, crs = crs)
plot(rast.proj)

# Use ggplot to generate projected maps
library(ggplot2)

# We need a data frame
df <- data.frame(
  coordinates(rast.crop),
  z = values(rast.crop))

p <- ggplot(data = df) +
  geom_tile(mapping = aes(x = x, y = y, fill = z))

p + coord_quickmap()
p + coord_map(projection = 'azequalarea')

library(ggalt)
p + coord_proj(proj = crs)



# Global analysis
df.rast <- data.frame(
  coordinates(rast),
  z = values(rast))

df.world <- map_data('world')

ggplot() +
  geom_raster(
    data = df.rast, 
    mapping = aes(
      x = x, y = y, fill = z)) +
  geom_polygon(
    data = df.world, fill = NA, color = 'black',
    mapping = aes(
      x = long, y = lat, group = group)) +
  theme_minimal() +
  coord_quickmap() +
  labs(x = '', y = '')

library(magrittr)
l <- df.world[, 1:2] %>%
  split(f = as.factor(df.world$group)) %>%
  lapply(1:length(.), function(i, l = l) {
    return(l[[i]] %>%
      as.matrix() %>%
      Polygon() %>%
      list() %>%
      Polygons(ID = i))}, l = .) %>%
  SpatialPolygons()

data <- unique(df.world[, c('group', 'region', 'subregion')])
row.names(data) <- data$group

spp <- SpatialPolygonsDataFrame(
  l, data = data)

plot(spp)