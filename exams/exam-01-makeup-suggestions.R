# Instructions:
# 
# 2 points
# 
# 1. Read the following style guides if you have not:
# 
#   - http://adv-r.had.co.nz/Style.html
#   - https://google.github.io/styleguide/Rguide.html
# 
# 2. There is one technical mistake in the function. Fix it.
# 3. Similar to the Question 6.4, please improve the CODE STYLE of the function.
# 
# Do not change the functionality which means do not change what the function 
# does. This function starts with several checks and then creates a list with
# the input as members. you are only supposed to fix one technical mistake
# and then improve the code style.
# 
# After you are finished with your changes, submit this R script to the exam
# named Exam 1 Make Up. Follow the name convension:
# 
# GEOG365_Exam1MakeUp_LastName_FirstName.R
# 
# Points will be taken off if names are not correct!
# 
# You do not need to compile this R script as a PDF file. Submit this R
# script directly.
# 

###############################################################################
#                         Modify the function code                            #
###############################################################################

# Suggestion 1: Indentation. You can simply copy and paste the code
# and RStudio will automatically do this for you.
# 

my.func <- function(station.name, x, y, obs) {
	
	# Suggestion 2: Blank lines between chunks of code would help reading the code.
	# 
	if (station.name != 'StateCollege') {
		
		# Suggestion 3: for loops and if statement should have 
		# braces, even if there is only one line of code.
		# 
		stop('Currently only support State College!')
	}
	
	# Suggestion 4: This variable name 'the_length_of_observation_input'
	# was BAD! Too long and too much details with 'the' and 'of'.
	# 
	obs.len <- length(obs)
	
	if (obs.len > 100) {
		
		# Same here. Add the braces after the if satement.
		stop('The observation input vector is too long!')
	}
	
	# Suggestion 5: This line is too long. It should be broken up
	# into multiple lines.
	# 
	# Suggestion 6: Put spaces before and after the assignment sign.
	# 
	# Suggestion 7: R prefers <- to = for assignment.
	# 
	ml <- list(
		StationName = station.name,
		
		# Suggestion 8: (a technical mistake) Latitude should be y and
		# longitude should be x.
		# 
		Longitude = x,
		Latitude = y,
		Mean = mean(obs, na.rm=T),
		Median = median(obs, na.rm=T))
	
	# Suggestion 9: Functions should have a return value.
	return(ml)
}

# Suggestion 10: A function should have some comments. This function
# does not do anything substantial but in general, comments help.
# 

###############################################################################
#                     Do not modify the following code                        #
###############################################################################
# To ensure that you have not changed the functionality, I expect the 
# following output from each command.
# 

my.func('DC')
# Error in my.func("DC") : Currently only support State College!

my.func('StateCollege', 1, 2, 1:200)
# Error in my.func("StateCollege", 1, 2, 1:200) : 
# The observation input vector is too long!

r <- my.func('StateCollege', 1, 2, 1:50)
stopifnot(class(r) == 'list')
stopifnot(r$Mean == 25.5)
# No errors!