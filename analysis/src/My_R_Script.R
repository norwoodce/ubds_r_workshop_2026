# This is a comment :)
100 + 101
3 + 5 * 10

# Help me remember order of operations
3 + (5*10)

# I want to add 3 first
(3+5)*10

#Do I need the multiplication symbol?
(3+5)10
#Answer is yes

#True or false
9 == 10
30 == 30

# Logic test can only be used with integers because apparently computers are not great with decimals??
10.01 == 10.01
10.01 == 10.000000000000000001
10.0 == 10.000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001
100000000000000000000000000000000000000000000000000 == 100000000000000000000000000000000000000000000000000.01
# Last two examples gives "true"
U == U
# Does not recognize

# What do fractions and very large numbers look like in R?
2/10000
50000000/2
50000000
# Uses scientific notation

## R has functions! Very exciting. Very fun.

# shows working directory location
getwd()

# math
sin(1)
# degrees or radians?
# Entering ?sin+enter in Console shows function explanation in Help tab, then search radians in the topic

## R has variables!! We love variables.

# Assigning operators
x <- 1/40
x = 1/100
# variable is tracked in Environment tab
# value can be updated...so be careful...
# R will have no memory of what X was before (although you can look back at previous script and rerun, as long as it's saved)
# = can only be used in some instances

# rm(x) in Console will remove variable assignment

## Don't forget to save your work periodically! Ctrl+S works here.

## R is a "vectorized language." R has vectors. 


1:5
# Gives a vector that starts with 1 and ends with 5, in numerical order (1, 2, 3, 4, 5)

x <- 3:10
# x can be assigned to a vector
# do I remember what vectors are??

# Vectors can be used in computations
2 ^ (x)
# Does 2* each number in the vector sequence

## Installing packages
install.packages("tidyverse")
library("tidyverse")

install.packages("dplyr")
library("dplyr")

library("ggplot2")


