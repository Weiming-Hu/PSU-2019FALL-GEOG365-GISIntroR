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
coast <- readOGR("ne_10m_coastline/ne_10m_coastline","ne_10m_coastline")
plot(coast)
plot(spTransform(coast,CRSobj = CRS("+proj=hammer")))


longitude <- c(-116.7, -120.4, -116.7, -113.5, -115.5, -120.8, -119.5, -113.7, -113.7, -110.7)
latitude <- c(45.3, 42.6, 38.9, 42.1, 35.7, 38.9, 36.2, 39, 41.6, 36.9)
lonlat <- cbind(longitude, latitude)

crdref <- CRS('+proj=longlat +datum=WGS84')
pts <- SpatialPoints(lonlat, proj4string=crdref)


plotProj = function( p, coast, pts ) {
  plot(spTransform(coast,CRSobj = CRS( p )))
  plot(spTransform(pts,CRSobj   = CRS( p )),add=T,col="blue")
}

p = c("+proj=hammer","+proj=cea","+proj=krovak","+proj=merc")

layout(matrix(1:4,nrow=2))

for ( proj in p) {
  plotProj(proj, coast, pts)
}