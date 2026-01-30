# DATA FRAME MANIPULATION with dplyr package

### dplyr is within the Tidyverse set of packages

library(dplyr)
library(tidyverse)
# Need to open package(s) using "library" function each time you open R!! They get closed when you close R.

## Read in data file

gapminder <- read.csv("analysis/data/gapminder_data.csv")

## Basic info

mean(gapminder$gdpPercap[gapminder$continent=="Africa"])
mean(gapminder$gdpPercap[gapminder$continent=="Americas"])
# shows mean GDP for each continent
# What if you wanted it to show the mean for each continent at once,
# rather than having to write the function out for each continent







## Select() function

### If multiple packages with same function names, 
### use dplyr::select() to make sure you're selecting from correct package

year_country_gdp <- dplyr::select(gapminder, year, country, gdpPercap)
head(year_country_gdp)
# shows only selected columns

small_gapminder_data <- select(gapminder, -continent)
head(small_gapminder_data)
# removed "continent" column








## Pipes (%>%)

### Pipes pass the data through functions from left to right
### Reduces the number of times you have to recall your data fram
### ctrl+shift+M = %>% 

year_country_gdp <- gapminder %>% select(year,country,gdpPercap)
head(year_country_gdp)
# saves space, time with larger chunks of code






## Rename() function 

###Renaming a column (can't do easily in base R)

tidy_gdp <- year_country_gdp %>% rename(gdp_per_capita=gdpPercap)
head(tidy_gdp)
# can rename multiple columns at a time, just use commas






## Filter() function

### Lets you select ROWS rather than COLUMNS (like select() function)

year_country_gdp_euro <- gapminder %>%
  filter(continent=="Europe") %>% 
  select(year, country, gdpPercap)

head(year_country_gdp_euro)
# shows only countries from Europe
# works despite removing continent column BECAUSE continent is filtered BEFORE rows are selected


euro_lifeExp_2007 <- gapminder %>%
  filter(year=="2007") %>% 
  filter(continent=="Europe") %>% 
  select(country, lifeExp)

head(euro_lifeExp_2007)


euro_lifeExp_2007_alt <- gapminder %>%
  filter(continent=="Europe",year=="2007") %>%
  select(country, lifeExp)

head(euro_lifeExp_2007_alt)





## group_by() function

str(gapminder)
# shows how data frame is organized (structured)

str(gapminder %>% group_by(continent))
# makes group data frame





## Summarize() function
### use dataset %>% group_by() %>% summarize()

gdp_by_continents <- gapminder %>% 
  group_by(continent) %>% 
  summarize(mean_gdpPercap=mean(gdpPercap))

gdp_by_continents






## Group_by() multiple variables

gdp_bycontinents_byyear <- gapminder %>% 
  group_by(continent,year) %>% 
  summarize(mean_gdpPercap=mean(gdpPercap))

head(gdp_bycontinents_byyear)






## Calculate multiple summary statistics at once

### Calculate mean and standard deviation for two different variables

gdp_pop_bycontinents_byyear <- gapminder %>%
  group_by(continent,year) %>% 
  summarize(mean_gdpPercap=mean(gdpPercap),
            sd_gdpPercap=sd(gdpPercap),
            mean_pop=mean(pop),
            sd_pop=sd(pop))
  
head(gdp_pop_bycontinents_byyear)








## count() and n() functions

### very similar; use depends on context
### count() groups by a requested variable and returns the number of observations for each value
### n() works inside other functions, such as summarize(), 
### to return the number of observations in a specific context

gapminder %>% 
  filter(year==2002) %>% 
  count(continent,sort=TRUE)
# will sort by highest number of observations to the lowest


gapminder %>% 
  group_by(continent) %>% 
  summarize(se_le = sd(lifeExp)/sqrt(n()))
# se = standard error; le = life expectancy; sqrt: square root
# se_le here = equation for standard error
# can use min and max as well (not shown)







## mutate() function

### create a new variable (column) within the existing data frame, based on other variables

gdp_pop_bycontinents_byyear <- gapminder %>% 
  mutate(gdp_billion = gdpPercap * pop / 10^9) %>% 
  group_by(continent,year) %>% 
  summarize(mean_gdpPercap=mean(gdpPercap),
            sd_gdpPercap=sd(gdpPercap),
            mean_pop=mean(pop),
            sd_pop=sd(pop),
            mean_gdp_billion=mean(gdp_billion),
            sd_gdp_billion=sd(gdp_billion))

head(gdp_pop_bycontinents_byyear)






## Combining ifelse with mutate()
gdp_pop_bycontinents_byyear_above25 <- gapminder %>% 
  mutate(gdp_billion = ifelse(lifeExp > 25,gdpPercap * pop / 10^9,NA)) %>% 
  group_by(continent,year) %>% 
  summarize(mean_gdpPercap=mean(gdpPercap),
            sd_gdpPercap=sd(gdpPercap),
            mean_pop=mean(pop),
            sd_pop=sd(pop),
            mean_gdp_billion=mean(gdp_billion),
            sd_gdp_billion=sd(gdp_billion))

head(gdp_pop_bycontinents_byyear_above25)
tail(gdp_pop_bycontinents_byyear_above25)








## Combining ggplot2 and dplyr

### Another way to subset data for plots
### %>% tells ggplot what the data set is, so just start with mapping

gapminder %>% 
  filter(continent=="Americas") %>% 
  ggplot(mapping=aes(x=year,y=lifeExp)) +
  geom_line() +
  facet_wrap( ~ country) +
  theme(axis.text.x = element_text(angle=45))
  












