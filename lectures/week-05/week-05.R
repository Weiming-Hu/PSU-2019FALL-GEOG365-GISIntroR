# title: "Period Review"
# author: "Weiming Hu"
# date: "September 24, 2019"
# 
# Task 1
# 
# Download the following files from
# 
# https://prosecco.geog.psu.edu/weather-underground-sample/
# 
# - WU-2017.csv
# - WU-2018.csv
# - WU-2019.csv
# 
# Make sure you have these three files before you carry on.
# 
# These files contain personal Weather Underground
# observations for one station in State College.
# 
# https://www.wunderground.com/dashboard/pws/KPASTATE60
# 
# 1.1 Read the files into R.
# 
# All three files have the same column names. Try to read
# data from three files into a single data frame since the
# column names are the same.
# 



# 1.2 Data Cleaning.
# 
# Examine the data that we have just read and recall the 
# steps to take for data cleaning, consistency and technical
# correctness.
# 
# Since we have a 'Time' column, we need to convert the column
# to a proper time R type. What is the current type for the 
# 'Time' column? Try to convert the column to POSIXct and then
# you can replace the original 'Time' column or add a new column
# for the POSIXct time.
# 
# How are missing values represented in this file? Try to identify
# them and replace them with NA. For example, for the column
# 'Solar.Rad', can you convert them to numerics?
# 



# 1.3 Visualization
#
# Plot a line graph for solar radiance. Try to improve the code
# with the following suggestions:
# 
# - Can you replace the x and y axises?
# - Can you show the time information on the x axis?
# - Can you limit the data to be shown in the graph?
# - Can you plot two y variables at a time, for example, solar
# radiance and output temperature?
#



# 1.4 What is the correlation between solar radiance and output
# temperature? Can you plot a scatter plot with output temperature
# being the explanatory variable and the solar radiance being the 
# response variable?
# 



# Task 2
# 
# 2.1 Download the shapefile for US parks and protected lands
# from http://www.naturalearthdata.com/downloads/10m-cultural-vectors/parks-and-protected-lands/
# 



# 2.2 Read a layer from the shapefile
# 
# Read the layer 'ne_10m_parks_and_protected_lands_area' from the data
# source provided 'ne_10m_parks_and_protected_lands'.
# 
# You might want to check the following packages and functions:
# 
# - rgdal::readOGR
# - maptools:readShapePoly
# 



# 2.3 Data exploration
# 
# What is the class of the object you just read? What do you know
# about this object? Can you examines some of its attributes? Can
# you extract the data table from the SpatialPolysDataFrame?
# 
# If your shapefile object is called 'shp', try to understand
# what the following commands accomplish:
# 
# - shp[[1]], shp[[2]], ...
# - shp[1, ], shp[2, ], ...
# - shape@polygons[[2]]@Polygons[[1]]@coords
#
# Can you get all coordinates of the polygons? Instead of doing
# the weird series of @, consider this function ggplot2:fortity.
# 


# 2.4 Visualization
# 
# Plot the polygons you have read. Consider the following suggestions:
# 
# - How to add a base map? You can use libraries ggmap or maps.
# - How to assign colors to each polygon based on the park name?
# 