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
# 
# Directly make changes to this R script and submit the finished R script
# following the name convention:
# 
# GEOG365_Exam2_LastName_FirstName.R

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

# Your code #


# 2) (2') From the entire census dataset, extract the rows given the 
# following conditions:
# 
# - Total population is between 50000 and 60000.
# - Male population is more than half of the county population.
# 
# Among the matched rows, which county has the fewest voting
# age citizens? (Use code to figure this out!)

# Your code #


# 2) (2') Read the shapefile for CONUS as a SpatialPolygonsDataFrame.
# This shapefile has the polygons for the continental US states.
# 
# Append state population data into this SpatialPolygonsDataFrame.
# 
# What is the length of the SpatialPolygonsDataFrame before and
# after appending the data?
# 

# Your code #


# 3) (1') Using the SpatialPolygonsDataFrame from Q2, 
# suppose you are only interested in analyzing the population
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

# Your code #


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

# Your code #


# 5) (1') Generate a map:
# 
# - Use the raster from Q4 as base map.
# - Overlay the polygons from Q2 for CONUS states.
# - Adjust the map region to the extent from Q3.
# - Make the map prettier.
# 

# Your code #
