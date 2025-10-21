library(tidyverse)


## About Tidy Data 
#Use tidyr::pivor_Wider() and tidyr::Pivor_Longer() to reshape datasets


#Tidy Data is a standard way of mapping the meaning of a dataset into its strucutre"
#in tidy data:
#each ariable forms a column 
#each observation forms a row 
# THIS IS CONNOLLY 

#Three inter-related rules that make a dataset tidy 
# 1: Each column is a variable 
# 2: Each row is an observation
# 3: Each cell is a single value 


table1 ## only one observation in each cell

table2 ## case count 

table3 #TB case rate

table4a ## case counts

table4b ## associated population counts 

table1 |> 
  mutate(rate = cases/population * 1000)

table1

table1 |> 
  group_by(year) |> 
  summarize(total= sum(cases)) ## easy because all the variables are already seperate variables

## much easier to work with tidydata 

view(table4a)
view(tidy4a)
tidy4a <- table4a |> 
  pivot_longer(c('1999', '2000'), 
               names_to = "year", 
               values_to = "cases")
table4b
table4b |> 
  pivot_longer(c('1999', '2000'),
              names_to = "year",
              values_to = "population")

tidy4b <- table4b |> 
  pivot_longer(c('1999', '2000'),
               names_to = "year",
               values_to = "population")

table2
table2 |> 
  pivot_wider(names_from = type, 
              values_from = count)

tidy2 <- table2 |> 
  pivot_wider(names_from = type, 
              values_from = count)
view(table2)
view(tidy2)
view(table3)
view(table5)

table3
table3 |> 
  separate(rate, into= c("cases","population"))

tidy3 <- table3 |> 
  separate(rate, into= c("cases","population")) # first encouter with a non numerical value then the fuction will split 


table3 |> 
  separate(rate, into=c("cases", "population"),
           sep="/", ## we can be specific as to "WHERE we want to seperate
           convert= TRUE ) 

table5 <- table3 |> 
  separate(year, into = c("century","year"), 
           sep=2) ### just another way that seperate can work 
table5
table5 |> 
  unite(fullyear, century, year,
        sep = "") # default is _ so "" is how to get rid of _ 













### LOTR datasets 
fship <- read_csv("https://raw.githubusercontent.com/jennybc/lotr-tidy/master/data/The_Fellowship_Of_The_Ring.csv")

ttow <- read_csv("https://raw.githubusercontent.com/jennybc/lotr-tidy/master/data/The_Two_Towers.csv")

rking <- read_csv("https://raw.githubusercontent.com/jennybc/lotr-tidy/master/data/The_Return_Of_The_King.csv")

## today we're focusing on importing data into 'r' 

##annoucements: next assignment is due Thursday PM 
library(tidyverse)

#the standard structure of tidy datasets are alkike
##but every messy dataset

#1. each variable in column
#2. each obsevation in a row
#3. each cell is a single measurment (think connolly)

coronavirus <- read_csv('https://raw.githubusercontent.com/RamiKrispin/coronavirus/master/csv/coronavirus.csv')


coronavirus |> 
  filter(country == "US", cases >= 0) |> 
  ggplot() + 
  geom_line(aes(x=date, y=cases, color = type)) ## don't need mapping because we have aes function 


corona_wide <- coronavirus |> 
  pivot_wider(names_from= type, 
              values_from = cases)## when we start splitting evey categorical variable into different column then we strt having to split everything into different layers 


coronavirus_ttd <- coronavirus |> 
  group_by(country, type) |>
  summarize(total_cases = sum(cases)) |>
  pivot_wider(names_from = type, values_from = total_cases)

# Now we can plot this easily
ggplot(coronavirus_ttd) +
  geom_label(mapping = aes(x = confirmed, y = death, label = country))

## tidy data = means a specific thing, but is context dependent 

  


