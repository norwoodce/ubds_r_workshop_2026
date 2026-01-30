### ggplot2 is used to create publication-quality figures 
### lots of customizability; ggplot2 is layered and reproducible

### Aesthetics (aes)
### Geometries (geom_*)
### Scales (scale_*)
### Statistics (stat_*)
### Facets (facet_*)
### Among other features

### labs() controls text
### theme() adjusts appearance
### ggsave() writes plot to disk

### Order of layers matters!! New layers will override previous layers.

###### not ggplot2 specific: "run" runs current line, highlighted section of code, or from cursor;
###### "source" runs entire script

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





################### Part 2






# Original plot

ggplot(data = gapminder,
       mapping=aes(x=gdpPercap,
                   y=lifeExp)) +
  geom_point()

# Scaling and alpha

## using log scale

ggplot(data = gapminder,
       mapping=aes(x=gdpPercap,
                   y=lifeExp)) +
  geom_point(alpha=0.5)+scale_x_log10()





# Geom_smooth

## search ?geom_smooth in Console for more info

## Use lm method with geom_smooth
ggplot(data = gapminder,
       mapping=aes(x=gdpPercap,
                   y=lifeExp)) +
  geom_point(alpha=0.5)+scale_x_log10()+geom_smooth(method="lm")


## change line thickness
ggplot(data = gapminder,
       mapping=aes(x=gdpPercap,
                   y=lifeExp)) +
  geom_point(alpha=0.5)+scale_x_log10()+geom_smooth(method="lm",
                                                    linewidth=1.5)





# Creating a multipanel plot

## First, subset data; then make plot
americas <- gapminder[gapminder$continent == "Americas",]
ggplot(data=americas,
       mapping=aes(x=year,
                   y=lifeExp)) +
  geom_line()+
  facet_wrap( ~ country) +
  theme(axis.text.x=element_text(angle=45))

## Add labels (labs)
americas <- gapminder[gapminder$continent == "Americas",]
ggplot(data=americas,
       mapping=aes(x=year,
                   y=lifeExp)) +
  geom_line()+
  facet_wrap( ~ country) +
  theme(axis.text.x=element_text(angle=45)) +
  labs(x="Year",y="Life Expectancy",title="Figure 1")
  
## Add color
americas <- gapminder[gapminder$continent == "Americas",]
ggplot(data=americas,
       mapping=aes(x=year,
                   y=lifeExp,
                   color = continent)) +
  geom_line()+
  facet_wrap( ~ country) +
  theme(axis.text.x=element_text(angle=45)) +
  labs(x="Year",y="Life Expectancy",title="Figure 1")
  
## Add more color; use a theme
americas <- gapminder[gapminder$continent == "Americas",]
ggplot(data=americas,
       mapping=aes(x=year,
                   y=lifeExp,
                   color = continent)) +
  geom_line()+
  facet_wrap( ~ country) +
  theme(axis.text.x=element_text(angle=45)) +
  labs(x="Year",y="Life Expectancy",title="Figure 1",color="Continent") +
  theme_minimal()

## Assign name to plot
americas <- gapminder[gapminder$continent == "Americas",]

life_exp_plot <- ggplot(data=americas,
       mapping=aes(x=year,
                   y=lifeExp,
                   color = continent)) +
  geom_line()+
  facet_wrap( ~ country) +
  theme(axis.text.x=element_text(angle=45)) +
  labs(x="Year",y="Life Expectancy",title="Figure 1",color="Continent") +
  theme_minimal()

## Export as png
### If not already in subfolder, "analysis/src/life_exp.png" etc
ggsave(filename="life_exp.png",
       plot = life_exp_plot,
       width = 12,
       height = 10,
       dpi = 300,
       units = "cm")

#### For publication, do dpi = 600


##### Move working directory (wd)

getwd()
setwd("...")
getwd()
setwd("C:/Users/Justin/Documents/Carson/workshops/ubds_r_workshop_2026")
getwd()

## Export as png again
ggsave(filename="analysis/life_exp.png",
       plot = life_exp_plot,
       width = 12,
       height = 10,
       dpi = 300,
       units = "cm")

  
  
  
  
  
  
  











