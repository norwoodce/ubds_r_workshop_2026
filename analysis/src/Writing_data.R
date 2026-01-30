# WRITING DATA





## Saving Plots

library(ggplot2)
# to confirm that you have ggplot2 downloaded

### Create plot

ggplot(gapminder,
       aes(x=year,
           y=lifeExp,
           color=country)) +
  geom_line() +
  theme(legend.position="none")

### Save most recent ggplot

ggsave("most_recent_gapminder_plot.pdf")
# saved as PDF in working directory

ggsave("analysis/results/most_recent_gapminder_plot.pdf")
# saved as PDF in subdirectory

ggsave("analysis/results/most_recent_gapminder_plot.png")
# saved as PNG in subdirectory

# can also "save as" from Plot tab but may have lower image quality!!!



### Save as PDF

pdf("analysis/results/plot_from_writing_data_pdf_gapminder.pdf",
    width=12,
    height=4)
# Does not work alone - saves empty PDF; most include plot code after and dev.off() function

ggplot(gapminder,
       aes(x=year,
           y=lifeExp,
           color=country)) +
  geom_line() +
  theme(legend.position="none")

dev.off()
# I don't know what this does specifically


#### Additional stuff
pdf("analysis/results/plot_from_writing_data_pdf_gapminder_2.pdf",
    width=12,
    height=4,
    pointsize=12,
    family="sans")

ggplot(gapminder,
       aes(x=year,
           y=lifeExp,
           color=country)) +
  geom_line() +
  theme(legend.position="none")

dev.off()


### Save multipage PDF

pdf("analysis/results/multi_page.pdf",
    width=10
    height=6)

# plot #1
plot(x=1:10,y=1:10)

# plot #2
plot(x=1:10,y=(1:10)^2)

# plot #3
    
# ...I didn't see the end of this code before he scrolled...







## Saving tables

# create subset
aust_subset <- gapminder[gapminder$country=="Australia",]

# check subset
head(aust_subset)
dim(aust_subset)

# write file
write.csv(aust_subset,
          file = "analysis/data/gapminder_aust_subset.csv",
          row.names = FALSE,
          quote = FALSE)

# write table
write.table(aust_subset,
             file = "analysis/data/gapminder_aust_subset_table.csv",
             sep = ",")
# sep = separation


## Other options for saving tables, I think

library(readxl)
WriteXLS::WriteXLS()   
# error: package is not downloaded

library(haven)
write_sas(df,"location") 
# error: not used correctly? not available?








## Reading a .csv file into R

gapminder_australia_read_dt <- read.csv("analysis/data/gapminder_aust_subset.csv")
# should see under "data" in Environment tab
    
gapminder_australia_read_dt
# should see data in Console
    
    
    
    
    
    
    