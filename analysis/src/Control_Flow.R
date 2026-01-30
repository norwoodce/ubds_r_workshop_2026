# IF STATEMENTS

x <- 8
x

if(x>=10) {
  print("x is greater than or equal to 10")
}
### this is not accurate!







## IF...ELSE STATEMENTS

if(x>=10) {
  print("x is greater than or equal to 10")
} else {
  print("x is less than 10")
}
### now this is accurate








## MULTIPLE TESTING CONDITIONS

### else if
if(x>=10) {
  print("x is greater than or equal to 10")
} else if(x>5){
  print("x is greater than 5 but less than 10")
} else {
  print("x is 5 or less")
}
### These run in the order they are written in; 
### if first statement is true, then it will not look at the following statements
### so be careful how you structure statements if multiple things can be true





## USE LOGICAL VALUES DIRECTLY

x <- 4 ==3
### Shows as FALSE

if(x){
  print("4 equals 3")
}else{
  print("4 does not equal 3")
}
### shows "4 does not equal 3"




## IFELSE FUNCTION

y <- -3
y

### ifelse(test, statement if y<0 is true, statement if y<0 is false)
ifelse(y<0,"y is a negative number","y is either positive or zero")








# MULTIPLE LOGICALS

x<-c(TRUE,TRUE,FALSE)


if(x){
  print("x is TRUE")
}
## gives an error


if(any(x)){
  print("At least one value of x is TRUE")
}
## Statement is printed in Console because this is true


if(all(x)){
  print("All of the values of x are TRUE")
}
# This is false, so no result is given in the Console









## FOR LOOPS 
### (similar to if statements for multiple logicals)

for(i in 1:10){
  print(i)
}


### Nested For Loops

for(i in 1:5){
  for (j in c("a","b","c","d","e")){
    print(paste(i,j))
  }
}

output_vector <- c()

for(i in 1:5){
  for (j in c("a","b","c","d","e")){
    temp_output <- paste(i,j)
    output_vector <- c(output_vector,temp_output)
  }
}

output_vector
############################################################################ Not the same output as instructor??
### Similar but with diff numbers


### Predefining the output size to save computational resources

output_matrix <- matrix(nrow=5, ncol=5)

j_vector <- c("a","b","c","d","e")

for (i in 1:5){
  for (j in 1:5){
    temp_j_value <- j_vector[j]
    temp_output <- paste(i,temp_j_value)
    output_matrix[i,j] <- temp_output
  }
}

output_matrix


output_vector2 <- as.vector(output_matrix)
output_vector2










# WHILE LOOPS 
## (less common - have to be cautious)

## Code will run forever if it gets stuck

z <- 1
z

while (z>0.1){
  z <- runif(1)
  cat(z,"\n")
}

### "\n" forces a line break for easier readability
### Will give random number of runs until it arrives at a correct answer

z<-1
z

while (z>0.1){
  z <- runif(1)
  print(z)
}

### cat and print are very similar but sometimes one looks better than the other

getwd()
