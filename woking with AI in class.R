library(tidyverse)

view(mtcars)

mtcars_6cycle <- mtcars |> 
  filter(cyl == 6)

view(mtcars_6cycle)

mtcars_4cycle <- mtcars |> 
  filter(cyl == 4)

mtcars_28cycle <- mtcars |> 
  filter(cyl == 8) ## copilot auto gentated this 

## copilot excpels at reccomending code 
# it lears from you coding 



## moving on toa complex task


#install.packages("palmerpenguins")
library(palmerpenguins)

# load the penguins dataset 

data("penguins")
view(penguins)



#visualize bill length by species 

ggplot(data = penguins, aes(x = species, y = bill_length_mm)) +
  geom_boxplot() +
  labs(title = "Bill Length by Penguin Species",
       x = "Species",
       y = "Bill Length (mm)") +
  theme_minimal()

# visualize flipper length by species
ggplot(data = penguins, aes(x = species, y = flipper_length_mm)) +
  geom_boxplot() +
  labs(title = "Flipper Length by Penguin Species",
       x = "Species",
       y = "Flipper Length (mm)") +
  theme_minimal()

#what is the reletationship between body mass and flipper length in penguins?
ggplot(data = penguins, aes(x = flipper_length_mm, y = body_mass_g, color = species)) +
  geom_point() +
  labs(title = "Body Mass vs Flipper Length by Penguin Species",
       x = "Flipper Length (mm)",
       y = "Body Mass (g)") +
  theme_minimal() +
  geom_smooth(method = "lm", se = FALSE) #add trend line

#facet by species

ggplot(data = penguins, aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point() +
  labs(title = "Body Mass vs Flipper Length by Penguin Species",
       x = "Flipper Length (mm)",
       y = "Body Mass (g)") +
  theme_minimal() +
  geom_smooth(method = "lm", se = FALSE) + #add trend line
  facet_wrap(~ species)



library(gapminder)
library(janitor)

gapminder_clean <- gapminder |> 
  clean_names()

glimpse(gapminder_clean)

#create a plot of gdp_per_capita vs year for each country use for loops 

unique_countries <- unique(gapminder_clean$country)
view(unique_countries)
for (country in unique_countries) {
  country_data <- gapminder_clean |> 
    filter(country == !!country)
  
  p <- ggplot(data = country_data, aes(x = year, y = gdp_per_capita)) +
    geom_line() +
    geom_point() +
    labs(title = paste("GDP per Capita over Time in", country),
         x = "Year",
         y = "GDP per Capita") +
    theme_minimal()
  
  print(p)
}

## gives you the code for the four loop 


