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

library(raster)

# https://neo.sci.gsfc.nasa.gov/view.php?datasetId=MOD_NDVI_M&year=2017


url = "MOD_NDVI_M_2017-08-01_rgb_1440x720.TIFF"


# Read the data
ndvi = raster(url)

# Set the value for water (255) equal to NA
w255 = values(ndvi) == 255
values(ndvi)[w255] = NA


# Define the NDVI as specified by the instructions
ndvitrue = (ndvi/255)-0.1

# Plot the data
plot(ndvitrue,col=grey.colors(100))


# Define a rectangle encompassing CONUS
#
ext = drawExtent()
plot(ndvitrue,col=grey.colors(100),ext=ext)

# Crop just the USA
ndviusa = crop( ndvitrue, ext)

# define a new colorscale
colors = colorRampPalette(c("#ECE0D7","#0B2403"))

# Plot the NDVI for the USA using a greenscale
plot(ndviusa,col=colors(100))

# Define a new extent and plot it transparent
ext2 = drawExtent()

# Convert it to Spatial Polygons
p <- as(ext2, 'SpatialPolygons')

# Plot it
plot(p,add=T,col="#FF000022")


# Plot a histogram for the values
hist(ndviusa)

