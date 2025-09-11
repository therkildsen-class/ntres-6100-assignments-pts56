library(tidyverse)
view(mpg)
#gg is for the grammar of graphics 
#in ggg plot is built from a series of data (Data-Aesthetics-Geometries_Facets_Stats-Coordinates-Theme)
plot(mpg$hwy,mpg$displ)#class "r" scatter plot i just learned in BTRY 


ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, # x and y axis 
                           color = class, size = cyl), # aesthetics 
             shape = 1). #makes the circles empty 

ggplot(data = mpg) +
  geom_point(mapping = aes(x = hwy, y = cyl))

ggplot(data = mpg) + 
    geom_point(mapping = aes(x = cyl, y = hwy))##changing x and y axis 

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = class, y = drv, color = class, size = drv))