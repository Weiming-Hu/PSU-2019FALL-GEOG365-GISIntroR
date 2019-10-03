#
#  "`-''-/").___..--''"`-._
# (`6_ 6  )   `-.  (     ).`-.__.`)   WE ARE ...
# (_Y_.)'  ._   )  `._ `. ``-..-'    PENN STATE!
#   _ ..`--'_..-_/  /--'_.' ,'
# (il),-''  (li),'  ((!.-'
#
#
# Author: Guido Cervone (cervone@psu.edu)
#         Weiming Hu (weiming@psu.edu)
#         
#         Geoinformatics and Earth Observation Laboratory (http://geolab.psu.edu)
#         Department of Geography and Institute for CyberScience
#         The Pennsylvania State University
#
# References:
#
# - https://www.earthdatascience.org/courses/earth-analytics/spatial-data-r/geographic-vs-projected-coordinate-reference-systems-UTM/
# - https://www.geographyrealm.com/types-map-projections/
# - https://www.rspatial.org/raster/spatial/6-crs.html
#

library(raster)
library(rgdal)
library(maps)
library(sp)

# Read the shapefile for the streams in the Streams directory.
# 
# If you have extract the zip file into a folder with the name
# "Streams", you need to change the path to "Streams/Streams" to
# include the folder name.
# 
r <- readOGR("Streams","River (PGIS)")

# Plot them
plot(r, col = "lightblue")

# add axis and box
axis(1)
axis(2)
box(); grid()
map(add = T, col = "grey")

# Let's download some cities data
url <- "http://simplemaps.com/static/data/world-cities/basic/simplemaps-worldcities-basic.csv"

# Read them and print them
cities <- read.csv(url,header = T)
points(cities$lng, cities$lat, cex = .5, pch = 19, col = "blue")

# These are the titles
names(cities)

# Let's just print Bangkok.
# This is the id (row number) for Bangkok
# 
bangkok.id <- which( cities$city == "Bangkok" )

points(cities$lng[bangkok.id], cities$lat[bangkok.id], col = "red", cex = 1)
points(cities$lng[bangkok.id], cities$lat[bangkok.id], col = "red", cex = 2)
text(cities$lng[bangkok.id], cities$lat[bangkok.id],
     "Bangkok", col = "red", pos=1)

# Now let's pring in green all cities with a population larger than a threshold
minpop <- 2e6

valid <- which(cities$pop >= minpop)

# Let's remove Bangkok because it's already printed
bgpos <- which(valid == bangkok.id)
valid <- valid[-bgpos]

points(cities$lng[valid], cities$lat[valid], col = "orange", cex = 1)
points(cities$lng[valid], cities$lat[valid], col = "orange", cex = 2)
text(cities$lng[valid], cities$lat[valid], cities$city[valid],
     col = "orange", pos = 1)

# Assign CRS
crs(r) <- CRS("+proj=longlat +datum=WGS84")

# Transform CRS
r.trans <- spTransform(r, CRS("+proj=lcc +datum=WGS84"))


plot(r.trans, col = "lightblue")
map(add = T)

library(ggplot2)
library(ggmap)
library(mapproj)

r.fort <- fortify(r)

ggplot() +
  geom_path(
    data = r.fort, 
    mapping = aes(x = long, y = lat, group = group)) +
  # coord_map() +
  # coord_quickmap() +
  coord_map(projection = 'perspective', dist = 1) +
  theme_bw()



