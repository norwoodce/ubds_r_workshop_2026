# Subsetting Data

## Accessing value by index
x <- c(3,4,6,7,8)
###### c() is the COMBINE function
x[0]

## Using negative index
x[-2]
x[-1:5]

## Saving sliced vectors
x <- x[-4]

## Naming vector values
x <- c(1.1,2.5,6.4,8.7)
names(x) <- c("a","b","c","d")
x

## Slice vector above to remove values (remove values at 3rd and 4th positions)
x[1:2]
# or
x[c(-3,-4)]
# or
x[c(1,2)]

## Access values from x using names - usually more reliable
x[c("a","c")]

## Access the values from x using LOGICAL value (TRUE/FALSE)
x[c("TRUE","FALSE","TRUE","FALSE")]
# This doesn't work due to quotes!! TRUE/FALSE do not need quotes
x[c(TRUE,FALSE,TRUE,FALSE)]
# notice that logical values and characters show up in different colors







# Subset using logical operators (<,>,==)
# Single = *tells* R that x = y; Double == *asks* R if x = y

## Is a value greater than 5?
x>5

## Which values are greater than 5?
x[x>5]
## Which values are less than 2?
x[x<2]

## What values are equal to 2.5?
x[x==2.5]

## When does x = c?
names(x)=="c"
## Which value(s) equal "c"?
x[names(x)=="c"]







# More logical operators (& and !)

## Using & (AND) operator

### Which values are greater than 2 and less than 8?
x>2 & x<8
### What are the values greater than 2 and less than 8?
x[x>2 & x<8]

## Using ! (NOT) operator

x
### Are the values greater than two?
x>2
### Are the values NOT greater than two?
!x>2
### Which values are greater than two?
x[x>2]
### Which values are NOT greater than two?
x[!x>2]

## all() and any()
### Are all of the values greater than 2? TRUE/FALSE
all(x>2)
### Are any of the values greater than 2? TRUE/FALSE
any (x>2)






# Non-unique names

x <- 1:8
x
names(x) <- c("a","a","a","a","b","b","c","d")
x
## Which values are equal to "a"?
x[names(x)=="a"]






# Using - (negative) operator for names

x
## x except the seventh value
x[-7]
## Can you use names for this?
x[-"a"]
### No! Need to use NOT function (!):
x[names(x)=="a"]
x[!names(x)=="a"]

x[names(x)==c("a","d")]
x[!names(x)==c("a","d")]

names(x) == c("a","d")
!names(x)==c("a","d")

x[names(x) !=c("a","d")]





# Recycling vectors

names(x) == c("a","d")
length(names(x))
length(c("a","d"))

c("a","c","a","c","a","c","a","c")

names(x)
names(x)==c("a","c")






# %in% OPERATOR TO CHECK COLUMN NAMES IN DATAFRAMES

names(x)
names(x) %in% C("a","c")
##########################################################################################3## not working???

x[names(x) %in% c("a","c")]










# DATA TYPE: FACTORS
f <- factor(c("a","a","b","c","c","d"))
f

f[f%in%c("b","c")]

f[-3]






# MATRICES
set.seed(1)

## rnorm creates random distibution of values
m <- matrix(rnorm(6*4),ncol=4,nrow=6)
m

m <- matrix(rnorm(6*4),ncol=4,nrow=6)
m
## Will give diff valyes each time

## [rows,columns]
### show rows 3 and 4 with columns 1 and 2
m[3:4,c(1,2)]

### show only row 3
m[3,]

### for row 3 (all columns)...something...not sure what drop is
m[3,,drop = FALSE]
### gives all values for row 3...

## What if you don't use commas to indicate rows, columns
m[6]
m
### gives row 6, column 1


## Matrices by rows and columns
# Auto: goes down then across
m2 <- matrix(1:24,ncol=4,nrow=6)
m2
m2[8]
# To go across then down:
m2 <- matrix (1:24,ncol=4,nrow=6,byrow=TRUE)
m2
m2[8]






## Search ?array in Console to get info on arrays






# Lists
## Useful for storing different data types together, ex: meta data

xlist <- list(a="Software Carpentry",
              b = 1:10,
              data = head(mtcars))
## mtcars is a data set automatically included with R (search ?mtcars in Console for more info)
xlist

xlist[1:2]
## shows elements 1 and 2 from the list

## accessing a specific value from a specific element
### What is the first value in the second element (b)?
xlist[[2]][1]

xlist[[2]]

xlist[["a"]]
xlist[["b"]]

## Show all elements in list

xlist$data
xlist







# Subsetting dataframes

## make sure you're accessing from the correct folder! 
## "data/gapminder_data.csv" did not work because this R script is saved in the "src" folder
## have to go back up a level to the "analysis" folder
gapminder <- read.csv("../data/gapminder_data.csv")

## Show first few rows of the file
head(gapminder)

## Show first few values of the "pop" column only
head(gapminder[["pop"]])


## Show all rows for columns 1-3 only
gapminder[,1:3]

## Show data where life expectancy is >80
gapminder[gapminder$lifeExp>80,]

## Save and push to git!!!
