#
#  "`-''-/").___..--''"`-._
# (`6_ 6  )   `-.  (     ).`-.__.`)   WE ARE ...
# (_Y_.)'  ._   )  `._ `. ``-..-'    PENN STATE!
#   _ ..`--'_..-_/  /--'_.' ,'
# (il),-''  (li),'  ((!.-'
#
#
#Author: Guido Cervone (cervone@psu.edu)
#        Geoinformatics and Earth Observation Laboratory (http://geolab.psu.edu)
#        Department of Geography and Institute for CyberScience
#        The Pennsylvania State University
#


library(rgdal)
library(sp)
library(maps)

# Read the shapefile for the streams in the Streams directory
r = readOGR("Streams","River (PGIS)")
plot(r, col="lightblue") # Plot them
axis(1) # add axis
axis(2)
box() ; grid()
map(add=T,col="grey")

# Let's download some cities data
url="http://simplemaps.com/static/data/world-cities/basic/simplemaps-worldcities-basic.csv"

# Read them and print them
cities = read.csv(url,header = T)
points(cities$lng, cities$lat,cex=.5,pch=19,col="blue")

# Let's just print Bangkok
names(cities)  # These are the titles

# This is the id (row number) for Bangkok
bangkok.id <- which( cities$city == "Bangkok" )

points(cities$lng[bangkok.id], cities$lat[bangkok.id],col="red",cex=1)
points(cities$lng[bangkok.id], cities$lat[bangkok.id],col="red",cex=2)
text(cities$lng[bangkok.id], cities$lat[bangkok.id],"Bangkok", col="red",pos=1)

# Now let's pring in green all cities with a population larger than a threshold
minpop <- 2e6

valid <- which(cities$pop >= minpop)

# Let's remove Bangkok because it's already printed
bgpos <- which(valid == bangkok.id)
valid <- valid[-bgpos]

points(cities$lng[valid], cities$lat[valid],col="orange",cex=1)
points(cities$lng[valid], cities$lat[valid],col="orange",cex=2)
text(cities$lng[valid], cities$lat[valid],cities$city[valid], col="orange",pos=1)

