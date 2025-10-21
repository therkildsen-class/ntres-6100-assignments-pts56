## Factors

library(tidyverse)
library(gapminder) #install.packages("gapminder")
library(gridExtra) #install.packages("gridExtra")

## Factors in R 
# Categorical variables that have a fixed and known set of possible values
# levels are ordered: have human readble names, but under the hood, r is really storing integers codes 1,2,4, etc
# useful for modeling, but also whe nyou want to display character vectors in a non-alphabethical order



# Intro factors -----------------------------------------------------------


x1 <- c("Dec", "Apr", "Jan", "Mar")

x2 <- c("Dec", "Apr", "Jan", "Mar")



month_levels <- c(
  "Jan", "Feb", "Mar", "Apr", "May", "Jun",
  "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
)

y1 <- factor(x1, levels = month_levels)


# Factors in Plotting -----------------------------------------------------

gapminder

str(gapminder$continent)
levels(gapminder$continent)
nlevels(gapminder$continent)

gapminder |> 
  count(continent)

nlevels(gapminder)

h_countries <- c("Egypt", "Haiti", "Romania", "Thailand", "Venezuela")

gapminder

h_gap <- gapminder |> 
  filter(country %in% h_country)

h_gap |> 
  count(country)

h_gap_dropped <- h_gap |> 
  droplevels()



# filter the gapminder data wherew the population is less than 250,000 and get used

gapminder <- gapminder

small_countries <- gapminder |> 
  filter(pop < 250000) |> 
  droplevels()

nlevels(small_countries$country)

gapminder |> 
  count(continent) |> 
  arrange(n)

gapminder$continent |> 
  fct_infreq() |> 
  fct_rev() |> 
  levels()

p1 <- gapminder |> 
  ggplot(aes(x = continent)) + 
  geom_bar() + 
  coord_flip()

p1


p2 <- gapminder |> 
  ggplot(aes(x = fct_infreq(continent))) + 
  geom_bar() + 
  coord_flip()
p2
## this is if we want to sort our levels in a factor based on infequency 
## other times we may want to sort the levles by the values of a different variable
## this is called reordering

gap_asia_2007 <- gapminder |> 
  filter(year == 2007, continent == "Asia")


gap_asia_2007 |> 
  ggplot(aes(x = lifeExp,
             y = fct_reorder(count(country )) + 
  geom_point()

  ## another thing that can be useful.. is if we have a line plot 
  
## the final thing that is very sueful to know 
## if we want to move some random level up front then we want o
# if we want to re code some levels 

#fct_recode"USA"



