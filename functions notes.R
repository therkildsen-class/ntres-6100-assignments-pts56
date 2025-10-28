library(tidyverse)


# we can write our own functions in r 
# A function is a piece of code written to carry out a spcified task; it can or csan not accccept arguments or parameters and it can no return one or more values

# syntax to create a function

#Functions: automate common taskss in a more powerful and general way than copy and pasting 
#Advantages: you can give meaningful names to code blocks, you can reuse code without copying and pasting, you can share code with others easily, you can break complex problems into simpler pieces

#When should you write a functoin?
# whenever you've copied and pasted a block of code more than twice( a good hint that you should have a function or a for loop)

#Basic Syntax 

#function_name <- function(inputs) { 
 # output_value <- do_something(inputs)
  #retur(output_value)
#}

calc_shrub_volume <- function(length, width, height ) {
  area <- length *width
  volume <- area * height ## we can call on a variable that we create within the function 
  return(volume) ## this is important: because it's what ask the code to give us an output when we call the function
}
# when we are defining a fucntoin it doesn't give an output 

calc_shrub_volume(2,3,4) # when we call the function with specific values it gives an output
# we can also assign the output to a variable

calc_shrub_volume(length = 0.8, weidth = 1.6, height = 2.0) # we can also name the arguments when we call the function

# we can also specify default values 

calc_shrub_volume <- function(length = 1, width = 1, height = 1 ) {
  area <- length *width
  volume <- area * height ## we can call on a variable that we create within the function 
  return(volume) ## this is important: because it's what ask the code to give us an output when we call the function
}

# the nice thing about default values is that they can be overwritten

calc_shrub_volume() # uses all default values
calc_shrub_volume(2) # overwrites length, uses default width and height
calc_shrub_volume(2, 3) # overwrites length and width, uses default height
calc_shrub_volume(2.3, 0.43, 4.1) # overwrites all default values

# good pracrice is that we don't need names for the required arguments, but we need the specify when we're overiding a default value eg..

calc_shrub_volume(0.8, 1.6, height = 2.0) 

est_shrub_mass <- function(volume) { 
  mass <- 2.65 * volume^0.9
  return(mass)
}

shrub_volume <- calc_shrub_volume(2.3, 0.43, 4.1)
shrub_mass <- est_shrub_mass(shrub_volume)



# since functions are marginal units, we can run functions within functions 









# we can also assign the output to a variable

shrub1_volume <- calc_shrub_volume(2.3, 0.43, 4.1)

shrub1_volume



convert_pounds_to_grams <- function(pounds) {
  grams <- pounds * 453.592
  return(grams)
}

convert_pounds_to_grams(10)
convert_pounds_to_grams(3.75)


calc_shrub_volume(0.8, 1.6, 2.0) |> 
  est_shrub_mass() # there's nothing inherently fancy about piping functions together like this

## how we can call functions within function

est_shrub_mass_from_raw <- fucntion(length, width, height) {
  volume <- calc_shrub_volume(length, width, height)
  mass <- est_shrub_mass(volume)
  return(mass)
}


#advice on how to name functions 
#my_awesome_function is not very helpful 
# f() is too short 


# use consistent prefix 

# it's really good to add comments when writing functions 
  
# there are two ways we can specifcy expectef values: one is by posistoin (that's less typing) we can also do length


library(tidyverse)
library(gapminder)


gapminder <- gapminder |> 
  rename("life_exp" = lifeExp, "gdp_per_cap" = gdpPercap)


est <- read_csv('https://raw.githubusercontent.com/OHI-Science/data-science-training/master/data/countries_estimated.csv')
gapminder_est <- gapminder |> 
  left_join(est)


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

cntry <- "Albania"

for (cntry in country_list) {
  
  print(str_c("Plotting ", cntry))
  
  gap_to_plot <- gap_europe |> 
    filter(country == cntry)
  
  my_plot <- ggplot(data = gap_to_plot, mapping = aes(x = year, y = gdp_tot)) +
    geom_point() +
    labs(title = str_c(cntry, "GDP", sep = " "), 
         subtitle = ifelse(any(gap_to_plot$estimated == "yes"), "Estimated data", "Reported data"))
  
  ggsave(filename = str_c("figures/europe/", cntry, "_gdp_tot.png", sep = ""), plot = my_plot)
  
}

# turn the above "for" loop into a function
plot_country_gdp <- function(cntry, filetype = "png") {
  
  print(str_c("Plotting ", cntry))
  
  gap_to_plot <- gap_europe |> 
    filter(country == cntry)
  
  my_plot <- ggplot(data = gap_to_plot, mapping = aes(x = year, y = gdp_tot)) +
    geom_point() +
    labs(title = str_c(cntry, "GDP", sep = " "), 
         subtitle = ifelse(any(gap_to_plot$estimated == "yes"), "Estimated data", "Reported data"))
  
  ggsave(filename = str_c("figures/europe/", cntry, "_gdp_tot.", filetype, sep = ""), plot = my_plot)
  
}


# change the plot_country_gap function so that I can specify png, jpg, or pdf
  plot_country_gdp <- function(cntry, filetype = "pdf") {
  print(str_c("Plotting ", cntry))
  gap_to_plot <- gap_europe |> 
    filter(country == cntry)
  my_plot <- ggplot(data = gap_to_plot, mapping = aes(x = year, y = gdp_tot)) +
    geom_point() +
    labs(title = str_c(cntry, "GDP", sep = " "), 
         subtitle = ifelse(any(gap_to_plot$estimated == "yes"), "Estimated data", "Reported data"))
  ggsave(filename = str_c("figures/europe/", cntry, "_gdp_tot.", filetype, sep = ""), plot = my_plot)
  }
  
# can i change this above function so i can choose from png, jpg, or pdf?
    
  ggsave(filename = str_c("figures/europe/", cntry, "_gdp_tot.", filetype, sep = ""), plot = my_plot)
  
  











# we can also write functions that contain for loops
plot_country_gdp <- function(cntry) {
  
  print(str_c("Plotting ", cntry))
  
  gap_to_plot <- gap_europe |> 
    filter(country == cntry)
  
  my_plot <- ggplot(data = gap_to_plot, mapping = aes(x = year, y = gdp_tot)) +
    geom_point() +
    labs(title = str_c(cntry, "GDP", sep = " "), 
         subtitle = ifelse(any(gap_to_plot$estimated == "yes"), "Estimated data", "Reported data"))
  
  ggsave(filename = str_c("figures/europe/", cntry, "_gdp_tot.png", sep = ""), plot = my_plot)
  
}

plot_country_gdp("Ireland")

library(gapminder)

print_plot


# write a for loop that runs a functoin for each of the conutries in your country list 
country list: Ireland, Scotland, Wales, England, Northern Ireland

country_list <- c("Ireland", "Scotland", "Wales", "England", "Northern Ireland")
for (cntry in country_list) {
  plot_country_gdp(cntry)
}

# we can also write functions that contain for loops
plot_countries_gdp <- function(country_list) {
  for (cntry in country_list) {
    plot_country_gdp(cntry)
  }
}


# A function is a reusable block of code that performs a specific task and can accept inputs and 
#return outputs. A for loop is a control structure that iterates over a sequence of values, 
#executing a block of code for each value in the sequence. Functions can contain for loops to perform repetitive tasks, while for loops are used to repeat actions within functions or other code blocks.





















