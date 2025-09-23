# How summarize function works: Collapses rows in a dataset down to a single row
## Remember Betsy when you make figures 
library(tidyverse)
library(skimr)


coronavirus <- read_csv('https://raw.githubusercontent.com/RamiKrispin/coronavirus/master/csv/coronavirus.csv')


coronavirus |> 
  filter(type== "confirmed") |>  
  group_by(country) |> 
  summarize(total =sum(cases),
            n = n()) |> 
  arrange(-total)


  
coronavirus |> 
  group_by(date,type) |> 
  summarize(total=sum(cases)) |> 
  filter(date=="2023-01-01")

#MY turn: which day has had the highest total death count globally reported in this data set:
# the pipe global daily death counts into ggplot to visualize the trend over time 

coronavirus |> 
  filter(type== "death") |> 
  group_by(date) |> 
  summarize(total = sum(cases)) |> 
  arrange(-total)

coronavirus |> 
  group_by(type) |> 
  summarize(scases=sum(cases)) 

gg_base <- coronavirus |> 
  filter(type=="confirmed") |> 
  group_by(date) |> 
  summarize(total_cases=sum(cases)) |> ## now for each day I have a global count
  ggplot(mapping = aes(x = date, y = total_cases))+ #now that we're in ggplot land we're not piping anymore 
  geom_line()+
  theme_minimal()

gg_base + 
  geom_col(color="darkred")
  
gg_base +
  geom_area(fill="lightblue")

gg_base + 
  geom_line(
    color="lavender"
  ) +
  theme_dark()

gg_base + 
  geom_point(
    shape = 5,
    size = 3,
    alpha = 0.3
  )

gg_base + 
  geom_point(mapping = aes(size=total_cases, color=total_cases),
             alpha=0.4
             ) + 
  theme_minimal() + 
  theme(legend.background = element_rect(
    fill = "lemonchiffon", 
    color = "gold",
    linewidth = 0.8
  )) 


gg_base + 
  geom_point(mapping = aes(size=total_cases, color=total_cases),
             alpha=0.4
  ) + 
  theme_minimal() + 
  theme(legend.position = "none")
## basically endless flexiblity to do additional information ourselves 


gg_base + 
  geom_point(mapping = aes(size=total_cases, color=total_cases),
             alpha=0.4
  ) + 
  theme_minimal() + 
  theme(legend.position = "none")+
  labs(
    x = "Date", 
    y = "Total confirmed cases",
    title = str_c("Daily counts of new coronavirus cases ", max(coronavirus$date)), ## can use tidyverse for coronavirus$date if you save it as an object above 
    subtitle = "Global sums"
  )

## we can include code into what ends up getting printed on our plot: we don't want to hard code numbers into plots. we want numbers to depend on what the data says incase the dataset updaes 


# now lets split the case counts out by country



coronavirus |>
  filter(type=="confirmed") |> 
  group_by(country, date) |> 
  summarize(total = sum(cases)) |> 
  ggplot() + 
  geom_line(mapping =aes(x= date, y= total))


## does the order that you put your group_by info in? It depends 


top5 <- coronavirus |> 
  filter(type =="confirmed") |> 
  group_by(country) |> 
  summarize(total = sum(cases)) |> 
  arrange(-total) |> 
  head(5) |> 
  pull(country)





  


