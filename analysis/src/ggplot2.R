### ggplot2 is used to create publication-quality figures 
### lots of customizability; ggplot2 is layered and reproducible

### Aesthetics (aes)
### Geometries (geom_*)
### Scales (scale_*)
### Statistics (stat_*)
### Facets (facet_*)
### Among other features

### Order of layers matters!! New layers will override previous layers.

library(ggplot2)

## make sure you're accessing from the correct folder! 
## "data/gapminder_data.csv" did not work because this R script is saved in the "src" folder
## have to go back up a level to the "analysis" folder
gapminder <- read.csv("../data/gapminder_data.csv")

### to see raw data, enter "gapminder" in Console

ggplot(data=gapminder)
# currently shows nothing! (correct)

### 3 basic layers needed: data, aes, geom_point
ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) + geom_point()

### Try with x = year instead of gdpPercap
ggplot(data=gapminder,mapping=aes(x=year,y=lifeExp)) + geom_point()
### Looks weird for the given data! How can we edit to make more sense?

### Add color and use geom_line instead of geom_point
ggplot(data=gapminder,mapping=aes(x=year,y=lifeExp,color=continent)) + geom_line()
### Still looks weird

### Add groups
ggplot(data=gapminder,mapping=aes(x=year,
                                  y=lifeExp,
                                  group=country,
                                  color=continent)) + geom_line()

### Use both geom_line and geom_point
ggplot(data=gapminder,mapping=aes(x=year,
                                  y=lifeExp,
                                  group=country,
                                  color=continent)) + geom_line() + geom_point()


### Changing aesthetic (aes) layers
#### Here, color is only applied to geom_line
ggplot(data=gapminder,
       mapping=aes(x=year,
                   y=lifeExp,
                   group=country)) +
  geom_line(mapping=aes(color=continent)) +
  geom_point()

#### Points are now BEHIND lines; geom_line is the top layer
ggplot(data=gapminder,
       mapping=aes(x=year,
                   y=lifeExp,
                   group=country)) +
  geom_point() +
  geom_line(mapping=aes(color=continent))
  
  
  
  
  
  
  
  
  
  











