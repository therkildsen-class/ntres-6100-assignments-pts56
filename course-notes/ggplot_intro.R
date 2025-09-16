library(tidyverse) ### important to load at the top of the document 
view(mpg)
#gg is for the grammar of graphics 
#in ggg plot is built from a series of data (Data-Aesthetics-Geometries_Facets_Stats-Coordinates-Theme)
plot(mpg$hwy,mpg$displ)#class "r" scatter plot i just learned in BTRY 


ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, # x and y axis 
                           color = class, size = cyl), # aesthetics 
             shape = 1) + #makes the circles empty 
  geom_smooth(mapping = aes(x = displ, y= hwy)) + #be careful to always include + 
  facet_wrap(~ year, nrow = 2) + 
  theme_dark() #theme function is a helpful way to make graphics look good 


ggplot(data=mpg,(mapping = aes(x = displ, y= hwy)) + 
         geom_point(mapping = aes(x = displ, y = hwy, # x and y axis 
                    color = class, size = cyl), # aesthetics 
                    shape = 1) + #makes the circles empty 
         geom_smooth() + 
         facet_wrap(~ year, nrow = 2)





ggplot(data = mpg) +
  geom_point(mapping = aes(x = hwy, y = cyl))

ggplot(data = mpg) + 
    geom_point(mapping = aes(x = cyl, y = hwy))##changing x and y axis 


## Exercise 3 
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy),
             color = "blue") # make sure to put color outside of the inital () 




ggplot(data=mpg, mapping = aes(x=displ, y=hwy)) +
  geom_point(mapping=aes (color=class, size=cyl), shape=1) +
  geom_smooth() +
  facet_wrap(~year, nrow=2) +
  theme_minimal()
## don't save figures mousy style: save them with code
 ggsave(filename="Rplot.pdf", width=8, height=4) # code to save plots with code 
?ggsave

