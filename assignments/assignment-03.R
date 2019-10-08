# This is the Assignment 3 for GEOG 365.
# 
# This script contains tasks you will need to complete and instructions for how
# to prepare your submission. Read through this document carefully.
# 
# Directly make changes to this R script and submit the finished R script
# following the name convention:
# 
# GEOG365_Assignment3_LastName_FirstName.R
# 
# Keep in mind the good practices for writing readable code!
#

# 1. Use the following website to get the coordinates for
# at least 10 locations that you have been within the continental US.
# 
# https://www.gps-coordinates.net/
# 
# Record the latitude, longitude, altitude, date of visit, and the
# name of the locations.
# 
# Make sure that:
# 
# - A single data frame is used to store all variables as columns;
# - The data frame has the following column names: Longitude, Latitude,
# Altitude, Time, and Name.
# - The data frame has at least 10 rows.
# - Round the values with only 2 decimal places.
# - Dates are stored as POSIXct.
# - Dates are not in either ascending or descending order.
# 
# Write the code and answer the question: what is the average altitude
# of the places you have been to?
# 

##################
# Your code here #
##################

# 2. Load the library 'sp' and convert the data frame you just created to a
# SpatialPointsDataFrame.
# 
# Use the length function to show how many spatial objects are included in
# the SpatialPointsDataFrame you just created.
# 

##################
# Your code here #
##################

# 3. Extract a SpatialPointsDataFrame where altitudes are larger than 
# the average altitude from the orignal SpatialPointsDataFrame.
# 
# Use length function to show the count of matched features.
# 

##################
# Your code here #
##################

# 4. Read the SpatialPolygonsDataFrame from the shapefile
#  'us-states.shp'. Transform this polygon shapefile to EPSG:4030.
# 
# You can find the definition of a particular CRS either from the Spatial
# Reference website (https://www.spatialreference.org/) or using the function
# make_EPSG from the package rgdal.
# 
# Plot the polygons before and after the transformation.
# 


##################
# Your code here #
##################

# 5. We learned the aggregate function during class. Use this
# function to aggregate the transformed US state map based on
# REGION.
# 
# Actually, the function aggregate also works for data frames.
# use the function to aggregate AREA based on REGION from the
# SpatialPolygonsDataFrame. Think of the following arguments:
# 
#   - x = ?
#   - by = ?
#   - FUN = sum
# 
# Merge the aggregated area data frame with the aggregated
# spatial objects based on REGION. Use the function spplot
# to plot a map with z value equals to the area.

##################
# Your code here #
##################

# 6. Use the package ggplot2 to complete the following tasks:
# 
# - Plot the tranformed map as the base map. You need the 
#   function fortify to organize the data.
#   
# - Overplot the visited locations on the base map as points.
# 
# - Connect the locations based on the ascending order of
#   altitudes. Use the function order when reordering data
#   frame rows. Do not sort rows manually. 
#   
# - Use the function geom_text to annotate visited
#   locations with names and altitudes. You need to specify
#   the following arguments:
#   
#   - data = ?
#   - mapping = ?
#   - nudge_x or nudge_y
# 
# - Make the map prettier by changing shapes, sizes, and colors. 
# 

##################
# Your code here #
##################

# 7. Based on the plot you have generated in the question 6,
# can you plot the same map with the following projections?
# 
# - orthographic
# - guyou
# 
# Try to use the function coord_map from the package ggplot2.
# 

##################
# Your code here #
##################

