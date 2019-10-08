# This is the Assignment 2 for GEOG 365.
# 
# This script contains tasks you will need to complete and instructions for how
# to prepare your submission. Read through this document carefully.
# 
# Directly make changes to this R script and submit the finished R script
# following the name convention:
# 
# GEOG365_Assignment2_LastName_FirstName.R
# 
# Keep in mind the good practices for writing readable code!
#

# You have been given a CSV file, 2018.csv. Make sure you have the file.
# 
# 1. Write the code to read the CSV files into a data frame in R. Print the
# dimension of the data frame.
# 

##################
# Your code here #
##################

# 2. There are some negative values in the column 'OutdoorTemperature' and
# there are some missing values represented as '--.-' in the column. Change
# the missing values and the negative values to NAs. Make sure the results
# are numeric. Print the summary information of outdoor temperature using
# the 'summary' function.
# 

##################
# Your code here #
##################

# 3. Convert the column 'Time' from character to POSIXct. Print the range
# of the column 'Time' using the function 'range()'.
# 

##################
# Your code here #
##################

# 4. Use the function 'cor' to compute the correlation between 
#   
#   1) outdoor temperature (x) and solar radiance (y);
#   2) outdoor humidity (x) and solar radiance (y);
#   
# Which pair has the stronger correlation? 1 or 2.
# 
# If you get NA, try to read the documentation for 'cor' or try to find how
# to deal with NAs when using the function 'cor'.
# 

##################
# Your code here #
##################

# 5. Plot a scatter plot with the package 'ggplot2'. The x variable is 
# outdoor humidity and the y variable is solar radiance. Also associate
# the color of points to the value of outdoor temperature so we can relate
# point colors to temperature.
# 

##################
# Your code here #
##################

# 6. Based on the figure generated from task 5, associate the color of
# points to the value of outdoor temperature by adding the argument
# 'color = ?' to the 'aes' mapping function.
# 
# Use the function 'scale_color_viridis_c()' with the argument
# "option = 'inferno'" to change the default color scheme.
# 

##################
# Your code here #
##################

# 7. Based on the figure you generated from task 6, add a regression
# line between x and y. You can use the function 'geom_smooth' and the
# following arguments to the function:
# 
#   1) data = ?
#   2) mapping = ?
#   3) formula = y ~ poly(x, 2) # We are fitting a polynomial line
#   4) method = 'gam'
#   

##################
# Your code here #
##################

# 8. Generate a line plot of the solar radiance between Sep. 15
# and Sep. 18 with the package 'ggplot2'. Try to make changes 
# to the following figure components:
# 
#   1) Change x axis name to 'Local Time'
#   2) Remove y axis name
#   3) Add title 'Solar Radiance' to the title
#   4) Add subtitle 'Time period Sep. 15 - 18'
#   5) Change the color of the line to 'darkorange'
# 

##################
# Your code here #
##################