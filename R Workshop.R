### Kyle Wilson and Senan Hogan-Hennessy, Fall 2017

### This file is an interactive introduction to R, with a focus towards its use for data analysis and economics


2+2
2*3

# COMMENTS
# ---- 
# On a line of code, anything that follows the # symbol is disregarded by R. This is
# called a comment. You should always leave detailed comments about what your code does
# so that other people (and your future self) can understand it.

# ----
# OBJECT CREATION
# ----
# Create an object by assigning a number of your choice to an object with a name of your choice
# I'll create an object named a and give it a value of 3
a <- 3

# In R, <- is used to assign values to objects

# Note that an object named a has now appeared in the Environment pane or R Studio. This
# allows you to keep track of all objects that exist in memory at any point

# If you now type your object's name in the console, you will see its value displayed
a

# ----
# OPERATIONS ON OBJECTS
# ---- 
# We can now perform operations on this object. For example,
a+1
a*3
a^2

# ----
# VECTORS
# ----
# Numeric objects in R can also be vectors rather than scalars (be sure that your vector 
# has a length of 6, as this will matter later):
b <- c(1, 2, 10, 50, 6, 15)

# This c() operator that we used stands for "combine" and is used to combine values into 
# a single object

# Let's now display this new object
b

# We can access individual elements of a vector as follows:
b[1]
b[2:4]

# Notice that the : operator was used to create a vector of sequential integers
2:4

# And we can assign these elements to new objects
d <- b[2:5]
d

# We can perform operations on objects in a variety of ways
b[1]*3
b+1
a+b
a*b
b/a
c(a, b)

# ----
# BUILT-IN FUNCTIONS
# ----
# R also has many built-in functions that we can apply to objects. For instance,
mean(b)
sum(b)
max(b)
sort(b)
length(b)

# You can easily bring up the help documentation for any of R's built-in functions by
# typing ? followed by the function name
?mean

# ----
# CHARACTER VECTORS
# ----
# There are many other classes of objects that can be created in R. 
# For example, we can create a character vector (also called a string in many languages)
claremont.colleges <- c("Pomona", "Pitzer", "Claremont McKenna", "Harvey Mudd", "Scripps")
claremont.colleges

# Notice that character elements must always be typed within quotation marks

# Of course, we can't perform mathematical operations on this
claremont.colleges*2

# ----
# LOGICAL VECTORS
# ----
# Another important class of vector is called a logical vector, a vector of TRUE or FALSE
# statements. For instance
small.b <- b <= 10
small.b

# or
b == 15

# We can even access a vector's elements based upon a logical condition
b[small.b]

# ----
# MATRICES
# ----
# Another important object class is a matrix
example.matrix <- matrix(data=b, nrow=2, ncol=3)
example.matrix

# The matrix function requires that we provide it with three things: a vector of values,
# our desired number of rows, and our desired number of columns

# We can access individual elements, rows, or columns of a matrix in the following way:
example.matrix[1, 2]
example.matrix[1, ]
example.matrix[, 2]

# A matrix's values can also be characters
cc.matrix <- matrix(claremont.colleges[1:4], 2, 2)
cc.matrix

# ----
# DATAFRAMES
# ----
# However, if we want each column of a matrix to contain a different class of object,
# we need a different class of object called a dataframe
example.data <- data.frame(college=claremont.colleges, enrollment=c(1663, 1067, 1328, 807, 989))
example.data

# This dataframe has two variables called college and enrollment. We can access elements of
# a dataframe the same way as with a matrix
example.data[2, 2]
example.data[1, ]
example.data[, 2]

# But, we can also access variables from a dataframe by their name
example.data$college
example.data$enrollment

# And we can perform operations on them
mean(example.data$enrollment)
sum(example.data$enrollment)
max(example.data$enrollment)

# ----
# FOR LOOPS
# ----
# Sometimes you may need your program to apply an operation repeatedly to a variety of 
# inputs. This task can be accomplished using what is called a for loop. 

# A very simple example
for (i in 1:10) {
  print(i)
}

# In this loop, the variable i is called an iterator. We could have used any name we wanted
# instead of calling it i.
# Note that R's print function simply displays its input in the console

# Suppose we want to ...

# We can also nest for loops
for (i in 1:3) {
  for (j in c(2, 4, 6)) {
    print(i*j)
  }
}

# This has many practical applications, such as filling out a matrix
example.matrix <- matrix(0, 4, 4)
example.matrix
for (i in 1:4) {
  for (j in 1:4) {
    example.matrix[i, j] <- i*j
  }
}
example.matrix

# ----
# IF STATEMENTS
# ----
# At times, you may need your program to apply an operation if a certain condition is satisfied
a
if (a > 3) {
  print("a is greater than 3")
}

# You may also want your program to apply a different operation if that condition isn't satisfied
if (a > 3) {
  print("a is greater than 3")
} else {
  print("a is less than or equal to 3")
}

# You might even want to allow for many possible cases
if (a > 3) {
  print("a is greater than 3") 
} else if (a == 3) {
  print("a is equal to 3")
} else {
  print("a is less than 3")
}

# It is often very useful to nest an if statement within a for loop
for (i in 1:10) {
  if (i < 5) {
    print(i + 1)
  } else {
    print(i + 100)
  }
}

# ---- 
# FUNCTIONS
# ----
# Despite the wide variety in R's built-in functions, it is often necessary to write your
# own in order to fit your situation.

# A simple function
add.one <- function(x) {
  z <- x+1
  return(z)
}
add.one(a)

# Note that we could have named our input variable anything we wanted instead of x.
# The return statement tells the function what value it should output

# Functions can also be applied to vectors (when appropriate)
add.one(b)

# Functions can also have multiple variables
multiply.then.add.one <- function(x, y) {
  z <- x*y
  return(z + 1)
}
multiply.then.add.one()

# Practice: 

# 1. create a function that returns the largest element of a numeric vector. BUT, do not
# use R's built-in max() function. Pretend that it doesn't exist.

# 2. create a function that returns the mean of a vector, but excludes all values which
# are greater than 10

manual.max <- function(x) {
  y <- sort(x)
  z <- y[length(y)]
  return(z)
}
manual.max(b)

conditional.mean <- function(x) {
  y <- x[x <= 10]
  return(mean(y))
}
conditional.mean(b)

# ----
# PACKAGES
# ----
# Oftentimes, the function you need doesn't exist in base R. But, it's likely that someone
# before you was in a similar situation and already wrote that function. Because R is open
# source, these user-created functions become available to the R community if the creator
# so wishes.

# For instance, suppose that you want to ... Base R doesn't contain a tool that will do this.
# But, because someone else saw a need, that function now exists. Let's try it.
try but get error

# R returned an error. That's because in order for a user-created function to become available
# to the R community, the developer must create what is called a package. And in order to 
# use the the functions contained in that package, we must install it
install.packages("...")

# Let's try that function again
try and no error

# ----
# PROBABILITY
# ----
# Because the R language was built by and for statisticians, it is particularly good at
# random number generation and performing calculations based upon probability distributions

# RNG example

# distribution example

# ----
# READING DATA
# ----

# ----
# DATA ANALYSIS & PLOTTING
# ----

# First let's go to this research group's webpage.
# http://www.equality-of-opportunity.org/
# Let's look over some of their data, look at a .csv file.

#install.packages('tidyverse')
#install.packages('ggplot2')
library(tidyverse)
library(ggplot2)

College.data <- read.csv("http://www.equality-of-opportunity.org/data/college/mrc_table1.csv")
View(College.data)

College.data %>% ggplot(aes(par_median , k_median )) + 
  geom_jitter() + 
  geom_smooth(method='lm') + 
  labs(x = "Median parent household income, $", 
       y = "Median child individual earnings in 2014, $", 
       title = "Intergenerational Income Comaprison among US Colleges") + 
  labs(caption = "(based on data from the Equaility of Opportunity Project, 
       Stanford University)")

# Adjust the plot to be grouped by state, recognising tidyverse datawrangling (dplyr).

College.data %>% 
  group_by(state) %>%
  summarise(par_median = mean(par_median),
            k_median = mean(k_median)) %>%
  ggplot(aes(par_median , k_median )) + 
  geom_text(aes(label = state)) + 
  geom_smooth(method='lm') + 
  labs(x = "Median parent household income, $", 
       y = "Median child individual earnings in 2014, $", 
       title = "Intergenerational Income Comaprison among US Colleges, by State") + 
  labs(caption = "(based on data from the Equaility of Opportunity Project, 
       Stanford University)")

# See some useful information about these packages here:
# https://www.rstudio.com/wp-content/uploads/2015/03/ggplot2-cheatsheet.pdf 
# https://www.rstudio.com/wp-content/uploads/2015/02/data-wrangling-cheatsheet.pdf 
