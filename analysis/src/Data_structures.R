# Data structures and types

## There are 5 data types in R (EVERYTHING is one of these five)

### 1. Doubles
double_var <- 3.14
typeof(double_var)

double_var_2 <- 1
typeof(double_var_2)

### 2. Integers (whole numbers!!)
int_var <- 4L
typeof(int_var)
# L required for integers

### 3. Complex numbers
complex_var <- 1 + 1i
typeof(complex_var)

### 4. Logicals (true or false)
logical_var <- TRUE
typeof(logical_var)

### 5. Characters (AKA strings) - letters, words etc
char_var <- "This is a character"
typeof(char_var)
# use double or single quotations around character

### Combining data types
45 + "word"
5 * "a"
#obvi doesn't work - just gives an error













# Collections

## Vectors

my_vector <- vector(length = 3)
my_vector
#all data in a vector must be the same data type

another_vector <- vector (mode="character", length=3)
another_vector
# returns empty characters

str(another_vector)
str(my_vector)

### Each thing in a vector is assigned something...

another_vector[1]

double_vector <- c(5,7,9)
double_vector
double_vector[3]
# [3] selects third item in the vector
### R starts counting at 1...other languages start counting at 0

### Change value in a vector by index
double_vector[1] <- 13
double_vector

### What if we define vectors with multiple data types?

multi_vector <- c(2,6,'3')
multi_vector
# results in "type coersion" - forces all items in the vector to be the same type (resulting in " " around the other numbers)

coercion_vector <- c('a', TRUE)
coercion_vector
str(coercion_vector)
str(multi_vector)

### Type coercion: logical > integer > double > complex > character
# So, a logical and a character together would result in the logical being converted to a character

another_coercion_vector <- c(4, TRUE)
another_coercion_vector
# True = 1, False = 0

### You CAN go against the coercion flow
character_vector <- c('0','2','4')
character_vector

converted_vector <- as.double(character_vector)
converted_vector











# Lists - like a collection of vectors
list_example <- list(1,"a", TRUE, 1+4i)
list_example
str(list_example)

### Lists CAN have different data types

### Lists are accessed differently from indices
list_example[[2]]
# Use double square bracket

### We can add metadata to lists!!
another_list <- list(title = "Numbers", numbers = 1:10, data = TRUE)
another_list
# Items do not have to be the same length (one here is a vector)

another_list$title
another_list$numbers
str(another_list$numbers)







# Matrix

matrix_example <- matrix(0, nrow=6, ncol=3)
matrix_example

### can check matrix dimensions, type
dim(matrix_example)
typeof(matrix_example)

### like vectors, matrices can also only have one data type

### We can check number of rows, columns
nrow(matrix_example)
ncol(matrix_example)

matrix_example[1,1]
# to find an item in a matrix, must give row and column
# row or column first??

matrix_example + 2
### adds 2 to each number in the matrix

matrix_example_2 <- matrix_example + 2










# Dataframes

cats <- data.frame(
  coat = c("calico", "black", "tabby"),
  weight = c(2.1,5.0,3.2),
  likes_catnip = c(1,0,1)
)
### you can do line breaks to make things more readable!!

cats
# makes a basic table!!

### You CAN mix data types BUT each column must be a single data type, and each row must have the same number of columns

typeof(cats)
# just gives "list"
# a data frame is ultimately a list of vectors

class(cats)
# gives "data.frame"

str(cats)
# str gives more info than typeof or class

### We can access columns by name!
cats

cats$weight
cats$coat
cats$likes_catnip

cats$weight + 2
# we can perform operations

cats$weight + cats$likes_catnip
# will also add these together...should probably be an error

cats$weight + "word"
# this one does give an error

paste("My cat is", cats$coat)
# combines strings and variables together
# similar to print function

typeof(cats$weight)
 
additional_cat <- data.frame(
  coat = "tabby",
  weight = "2.3 or 2.4",
  likes_catnip = 1
)

additional_cat

### combine the cats!!
combined_cats <- rbind(cats, additional_cat)
combined_cats

typeof(cats$weight)
typeof(combined_cats$weight)
# weight becomes a character instead of a double because it is a character for additional_cat
# There was no error message! Always check for type coercion.

### gives full table
cats
# gives item in first row and first column
cats[1,1]
# gives first column
cats[,1] 
# gives first row
cats [1,]









