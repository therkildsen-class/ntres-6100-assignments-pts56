library(tidyverse)
library(gapminder) 
# Lesson 15: iteration Part 1: 
#announcements 
#on october 30th we'll have end of course presentations 
# just posted updated versions of assignments 8 and 9 
#key programming concepts: iteratoin and conditional excution 
#what do do if we have to do the same thing over and over again

##four loop (If and ifelse)

view(gapminder)




country_list <- c("Chile", "Argentina", "Canada" )
country_list <- unique(gapminder$country)

dir.create("figures")

for (cntry in country_list) {
  
  gap_to_plot<-  gapminder |> 
    filter(country == cntry)
  gap_to_plot
  
  my_plot <- ggplot(data = gap_to_plot,
                    mapping = aes(x = year,
                                  y = gdp_per_cap)) +
    geom_point() + 
    labs(title = str_c(cntry, "GDP per cap", sep = " ")) +
    ggsave(filename = str_c("figures/", cntry, "_gdp_per_gap.png", sep = "", plot = my_plot)
}

#### much more simple fout loop 







