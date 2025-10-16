library(tidyverse)
library(gapminder) 
# Lesson 15: iteration Part 1: 
#announcements 
#on october 30th we'll have end of course presentations 
# just posted updated versions of assignments 8 and 9 
#key programming concepts: iteratoin and conditional excution 
#what do do if we have to do the same thing over and over again

##four loop (If and ifelse)




cntry <- "Belgium"


for (each_country in list_of_countries) { ## our for loop set up 

gap_to_plot<-  gapminder |> 
  filter(country == cntry)
gap_to_plot_afg

my_plot <- ggplot(data = gap_to_plot_afg,
                  mapping = aes(x = year,
                                y = gdp_per_cap)) +
  geom_point() + 
  labs(title = str_c(cntry, "GDP per cap", sep = " ")) 

my_plot

ggsave(filename = str_c(cntry, "_gdp_per_gap.png", sep = "", plot = my_plot)


}




