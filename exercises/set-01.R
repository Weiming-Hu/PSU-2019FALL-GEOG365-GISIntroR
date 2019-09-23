# Description: This is the GEOG 365 weekly exercise set 1
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
# Create a vector
vec <- 1:10

# If you want to see the content of the vector, you
# can simple do the following:
# 
print(vec)

# Or, to make this more complicated, we can use a for loop
for (i in seq_len(length(vec))) {
  
  # Hold on! You might wonder why not print?
  # You can try for yourself.
  # 
  cat(vec[i], ' ')
}

# Similarly, let's create a matrix
mat <- matrix(1:50, nrow = 10)

# If you want to see the content of the matrix, you 
# can simply do the following:
# 
print(mat)

# Can you use mimic the above code and use 
# for loops to show the content. Please try to 
# make your output as similar as possible to the
# output from `print(mat)`.
# 
# Write your code below






###########################################################
#                       Question 2                        #
###########################################################
# Clean your environment and have a fresh start.
rm(list = ls())

# Create a sequence
xs <- seq(from = 1, to = 30, by = pi/8)

# Create the values from a sine function
ys <- sin(xs)

# Check this figure out
url <- 'https://github.com/Weiming-Hu/PSU-2019FALL-GEOG365-GISIntroR/blob/master/figures/set-01-q-02.jpeg'

# If this fails for you, you can just copy and paste the 
# url to your web browser.
# 
browseURL(url = url)

# Try to complete the following code to reproduce the figure.
# 
# You need to decide the function arguments. You need these 
# arguments, so do not delete them. Just change the question
# mark to the correct value.
# 
# After the arguments are changed, there are still some additional
# arguemnts I did not indicate in the code. Could you find them?
# 
par(mfrow = ?)

plot(?, ?, main = ?)

plot(?, ?, type = ?, xaxt = ?, yaxt = ?, lwd = ?)

plot(?, ?, type = ?, cex = ?, pch = ?)

barplot(?, border = ?)





