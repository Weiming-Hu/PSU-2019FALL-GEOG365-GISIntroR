# Description: This is the GEOG 365 exercise set 2
# 
# Instructor: Weiming Hu
# 
# Instructions:
# 
# Directly write your code into this file. Make sure
# when you "Source" this file, there are no errors. 
# After debugging, respond to the specific discussion
# and attach this file to your response.
# 
# You will be able to see other people's code if there
# are any. I recommand try this out by yourself before
# you other people's solutions.
# 

###########################################################
#                       Question 1                        #
###########################################################
library(ggplot2)

# Load the data
data('midwest')

# What is the class of the data we just loaded?


# What are the dimensions of the data?


# What are the column names of the data?


# A tibble is very similar to data frame. In fact,
# you can treat it almost like a data frame for now.
# 

# Generate a scatter plot with x being the area and y
# being the total population
# 


# Based on the plot you have generated, can you add 
# fit a regression line and add it to the figure?
# 
# This is easier to do if you are using ggplot, try
# the function `geom_smooth`.
# 


# Based on the plot you have generated, associate the
# point color with state. To do this, you need to 
# add additional argument to your mapping argument.
# 


# Based on the plot you have generated, change the 
# color scheme using the function
# 
# 'scale_color_viridis_d(option = 'magma')'
# 
# What does "option = 'magma'" mean? Can you find it
# out in the function documentation?
# 
# What is the difference between 
# 
# `scale_color_viridis_d`
# 
# and
# 
# `scale_color_viridis_c` ?
# 


# Can you generate a bar chart of the total population
# for different state? The first column should be IL
# with a count over 1.2e+07.
# 
# If you see the following error:
# 
# Error: stat_count() must not be used with a y aesthetic.
# 
# You need to add the argument "stat = 'identity'" in the
# function `geom_bar`.
# 
# What does 'stat' argument do? (This is a bit hard to
# figure out.)
# 


