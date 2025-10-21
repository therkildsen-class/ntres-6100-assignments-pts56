
## you should prepare for your presentatoin (thueaday will be the last day) 

# presentatoins should be ~3 minutes (anuything r related) tidy data: fairly new... connect to project with excel 


library(tidyverse)
library(gapminder)

gapminder <- gapminder |>
  rename("life_exp" = lifeExp, "gdp_per_cap" = gdpPercap)

est <- read_csv('https://raw.githubusercontent.com/OHI-Science/data-science-training/master/data/countries_estimated.csv')


gapminder_est <- gapminder |> 
  left_join(est)

view(gapminder_est)

## for if else statement 

if ()

## if, else (something rather than nothing)


  
  

cntry <- "Belgium"
country_list <- c("Albania", "Canada", "Spain")
dir.create("figures")
dir.create("figures/europe")
country_list <- unique(gapminder$country)


gap_europe <- gapminder_est |>
  filter(continent == "Europe") |>
  mutate(gdp_tot = gdp_per_cap * pop)
country_list <- unique(gap_europe$country)

length(country_list)

view(country_list)

for (cntry in country_list) {
  print(str_c("Plotting ", cntry))
  
  gap_to_plot <- gap_europe |>
    filter(country == cntry)
  my_plot <- ggplot(data = gap_to_plot, mapping = aes(x = year, y = gdp_tot)) +
    geom_point() +
    labs(title = str_c(cntry, "GDP", sep = " "))
  
  if (any(gap_to_plot$estimated == "yes")) {

    
    print(str_c(cntry,"data are estimated"))
    
    my_plot <- my_plot + 
      labs(subtitle = "Estimated data")
  } else {
    
    
    
    print(str_c(cntry,"data are reported"))
    
    my_plot <- my_plot + 
      labs(subtitle = "reported data")
  }
    
  ## this whole construct will give us different values based on the different value (you could totall use this for HCNRA jetboat data)
    
  ggsave(filename = str_c("figures/europe/", cntry, "_gdp_tot.png", sep = ""), plot = my_plot)}





  ## else is going to refer back to the if statement (it will not run on its own) 

  
  
  
  
}