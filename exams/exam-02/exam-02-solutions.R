#  "`-''-/").___..--''"`-._
# (`6_ 6  )   `-.  (     ).`-.__.`)   WE ARE ...
# (_Y_.)'  ._   )  `._ `. ``-..-'    PENN STATE!
#   _ ..`--'_..-_/  /--'_.' ,'
# (il),-''  (li),'  ((!.-'
#

# Dear student,
# This is the second exam for GEOG 365.

# When you are done, turn in the R script that you have generated.   
# To grade your exam we will run the script using the source command.
# Therefore, make sure that you first clean your environment, and all
# the output and plots are properly generated when you click source.

library(sp)
library(rgeos)
library(rgdal)
library(raster)
library(ggplot2)
library(magrittr)

# 1) (2') Read a table from the provided CSV file. This file provdes county-
# level population data.
# 
# Generate a barplot of employed population for Pennsylvania. Make sure:
# 
# - The x axis is each county in Pennsylvania.
# - The y axis is the employed population.
# - Fill the bars with two colors, one for above-mean-population counties,
#   and one for below-mean-population counties.
# 
# Key points: read csv; extract Penn; plot; color

census <- read.table(
  'data/us-county-pop.csv',
  header = T, sep = ':')

selected <- census$State == 'Pennsylvania'

df1 <- data.frame(Count = census$Employed[selected],
                  County = census$County[selected])

df1$Over <- df1$Count > mean(df1$Count)

ggplot(data = df1) +
  geom_bar(stat = 'identity', mapping = aes(
    x = County, y = Count, fill = Over)) +
  labs(x = '', y = 'Population')


# 2) (2') From the entire census dataset, extract the rows given the 
# following conditions:
# 
# - Total population is between 50000 and 60000.
# - Male population is more than half of the county population.
# 
# Among the matched rows, which county has the fewest voting
# age citizens? (Use code to figure this out!)
# 
# Key points: extraction; population; minumum; result

conditions <- census$TotalPop > 50000 &
  census$TotalPop < 60000 &
  census$Men > census$TotalPop * 0.5

census$County[conditions][which.min(
  census$VotingAgeCitizen[conditions])]


# 2) (2') Read the shapefile for CONUS as a SpatialPolygonsDataFrame.
# This shapefile has the polygons for the continental US states.
# 
# Append state population data into this SpatialPolygonsDataFrame.
# 
# What is the length of the SpatialPolygonsDataFrame before and
# after appending the data?
# 
# Key points: read file; length; aggregate; merge; length

conus <- readOGR('data/conus')
length(conus)

state.pop <- aggregate(
  census$TotalPop, list(State = census$State),
  FUN = sum, na.rm = T)

colnames(state.pop)[2] <- 'Population'

conus <- merge(conus, state.pop, by.x = 'NAME_1', by.y = 'State')

length(conus)


# 3) (1') Suppose you are only interested in analyzing the population
# within the following polygon.  
# 
# ################# Do not modify Below ########################
spp <- c('xmin' = -81, 'xmax' = -70,
         'ymin' = 36, 'ymax' = 43) %>%
  extent() %>%
  as('SpatialPolygons')

crs(spp) <- CRS('+proj=longlat +datum=WGS84 +no_defs
                +ellps=WGS84 +towgs84=0,0,0')
# ################# Do not modify Above ########################
# 
# Plot the state polygons within this extent and fill each state
# polygon with colors based on the population.
# 
# Key points: intersect; plot; color population

conus %>% intersect(spp) %>% spplot(z = 'Population')


# 4) (2') Read the GeoTiff file as a raster. They represent average
# monthly climate data for 1970-2000 for the most part of the 
# Northern hemisphere.
# 
# The spatial domain for the raster is much larger than the
# CONUS layer. Use some of the spatial operations that we learned
# to make the extent of raster consistent with the CONUS layer.
# 
# Plot the original raster and the final raster after all 
# spatial operations. 
# 
# Key points: read file; extent; reprojection; plots

rast <- raster('data/tmax-climo.tif')
plot(rast)

rast <- rast %>%
  projectRaster(crs = crs(conus)) %>%
  crop(y = extent(conus))

plot(rast)


# 5) (1') Generate a map:
# 
# - Use the raster from Q4 as base map.
# - Overlay the polygons from Q2 for CONUS states.
# - Adjust the map region to the extent from Q3.
# - Make the map prettier.
# 
# Key points: sp to df; raster to df; raster plot; polygon plot; extent

df.rast <- rast %>%
  crop(spp) %>%
  {data.frame(
    coordinates(.),
    Temperature = values(.))}

df.sppdf <- conus %>%
  crop(spp) %>%
  fortify()

ggplot() +
  geom_raster(
    data = df.rast,
    mapping = aes(
      x = x, y = y,
      fill = Temperature)) +
  geom_polygon(
    data = df.sppdf,
    fill = NA,
    color = 'grey',
    mapping = aes(
      x = long, y = lat, group = group)) +
  scale_fill_viridis_c(option = 'magma') +
  theme_bw() +
  labs(x = '', y = '') +
  coord_quickmap()
  