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
# - 2017.csv
# - 2018.csv
# - 2019.csv
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

# Direct download files from the URL
base.url <- 'https://prosecco.geog.psu.edu/weather-underground-sample/'

# These are the files to download
file.names <- c('2017.csv', '2018.csv', '2019.csv')

# Initialize
data <- data.frame()

for (file.name in file.names) {
  
  cat('Processing', file.name, '...\n')
  
  # Construct the full URL to download
  full.url <- paste0(base.url, file.name)
  
  # Read directly from online data repository
  data.single <- read.csv2(
    full.url, header = T, sep = '\t',
    stringsAsFactors = F)
  
  # Row bind new data to the complete data frame
  data <- rbind(data, data.single)
}

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

# Convert time from characters to POSIXct
data$Time <- as.POSIXct(data$Time, format = '%H:%M %d/%m/%Y')

# For the rest of the columns that are characters, convert then to
# numerics. Non-numeric values will be converted to NA automatically.
# 
for (colname in colnames(data)) {
  if (class(data[[colname]]) == 'character') {
    data[[colname]] <- as.numeric(data[[colname]])
  }
}

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
library(ggplot2)

ggplot() +
  geom_line(data = data, mapping = aes(
    x = Time, y = Indoor.Humidity....),
    color = 'navyblue') + 
  geom_line(data = data, mapping = aes(
    x = Time, y = Outdoor.Temperature..C.),
    color = 'darkorange') +
  scale_color_gradient(
    low = 'black', high = 'red') +
  xlim(data$Time[1], data$Time[3000]) +
  labs(x = 'Local time', y = 'Solar')

# 1.4 What is the correlation between solar radiance and ourdoor
# temperature? Can you plot a scatter plot with output temperature
# being the explanatory variable and the solar radiance being the 
# response variable?
# 
cor(data$Solar.Rad...w.m2.,
    data$Outdoor.Temperature..C.,
    use = 'complete.obs')

ggplot(data = data, mapping = aes(
  x = Outdoor.Temperature..C.,
  y = Solar.Rad...w.m2.)) +
  geom_point()
