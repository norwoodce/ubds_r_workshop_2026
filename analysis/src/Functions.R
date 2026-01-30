# Functions



## SETTING FUNCTIONS

### Function #1
fahr_to_kelvin <- function(temp){
  kelvin <- ((temp-32)*(5/9))+273.15
  return(kelvin)
}

#### Run function
fahr_to_kelvin(32)
fahr_to_kelvin(212)

### Function #2

kelvin_to_celsius <- function(temp){
  celsius<-temp-273.15
  return(celsius)
}

#### Run function
kelvin_to_celsius(300)




## COMBINING FUNCTIONS

fahr_to_celsius <- function(temp){
  temp_k <- fahr_to_kelvin(temp)
  temp_c <- kelvin_to_celsius(temp_k)
  return(temp_c)
}

fahr_to_celsius(32)
# output: 0
fahr_to_celsius((212))
# output: 100





## USING CHARACTER VALUES IN FUNCTIONS

fahr_to_kelvin("a")
# function does not work with character values - results in error

### Use an "if" statement

fahr_to_kelvin <- function(temp){
  if(!is.numeric(temp)){
    stop("temp must be a numeric value")
  }
  kelvin <- ((temp - 32) * (5/9)) +273/15
  return(kelvin)
}

fahr_to_kelvin("a")
# still gives an error but includes indicated message

print("Hello")
# this is not run using "source" because script stops when it hits the error for the above function

### stopifnot() - requires more lines of code than ! function

fahr_to_kelvin<-function(temp){
  stopifnot(is.numeric(temp))
  kelvin <- ((temp - 32) * (5/9)) +273/15
  return(kelvin)
}

fahr_to_kelvin("a")






## COMPLEX FUNCTIONS

### Specific function created for the gapminder data frame
calcGDP <- function(dat){
  gdp<-dat$pop * dat$gdpPercap
  return(gdp)
}

head(gapminder)

calcGDP(head(gapminder))
# pulls GDP per capita for first 6 rows


### Adding more arguments

calcGDP<-function(dat,year=NULL,country=NULL){
  if(!is.null(year)){
    dat <- dat[dat$year %in% year,]
  }
}
# tells R that there should not be data without a year or a country...maybe?
# subsetting dataframe by the year the user is inputting

calcGDP<-function(dat,year=NULL,country=NULL){
  if(!is.null(year)){
    dat <- dat[dat$year %in% year,]
  }
  if(!is.null(country)){
    dat <- dat[dat$country %in% country]
  }
  gdp <- dat$pop * dat$gdpPercap
  new <- cbind(dat,gdp=gdp)
  return(new)
}

#### I have no idea what's happening

head(calcGDP(gapminder,country="Australia"))
# incorrect - error in Console shows you where the error is
# columns are not defined - need a comma after %in% country

calcGDP<-function(dat,year=NULL,country=NULL){
  if(!is.null(year)){
    dat <- dat[dat$year %in% year,]
  }
  if(!is.null(country)){
    dat <- dat[dat$country %in% country,]
  }
  gdp <- dat$pop * dat$gdpPercap
  new <- cbind(dat,gdp=gdp)
  return(new)
}

head(calcGDP(gapminder,country = "Australia"))
head(calcGDP(gapminder,country = "Australia",year="2007"))
# now these work

## this changes one of the "nulls" to "na" but the output doesn't look any different to me??
calcGDP<-function(dat,year=NULL,country=NULL){
  if(!is.null(year)){
    dat <- dat[dat$year %in% year,]
  }
  if(!is.na(country)){
    dat <- dat[dat$country %in% country,]
  }
  gdp <- dat$pop * dat$gdpPercap
  new <- cbind(dat,gdp=gdp)
  return(new)
}

head(calcGDP(gapminder,country = "Australia"))
head(calcGDP(gapminder,country = "Australia",year="2007"))
# idk what is changing








## SUM FUNCTION

### Sum 5 numbers

sum_my_numbers <- function(x){
  y <- sum(x)
}

x <- c(1,2,3,5,4)
sum_my_numbers(x)
# does not work - need to add return statement


### Add return statement to return y only
sum_my_numbers <- function(x){
  y <- sum(x)
  z <- mean(x)
  return(y)
}

x <- c(1,2,3,5,4)
sum_my_numbers(x)


### Return y and z
sum_my_numbers <- function(x){
  y <- sum(x)
  z <- mean(x)
  yz <- c(y,z)
  return(yz)
}

x <- c(1,2,3,5,4)
sum_my_numbers









## UNIQUE FUNCTIONS

head(gapminder)

unique(gapminder$country)
# shows each unique country in the data set









