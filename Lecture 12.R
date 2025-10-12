## learn to combine information from multiple tables into one 
## describe the differeence between four join and two filter functions 
library(tidyverse)
library(nycflights13) ##install.packages("nycflights13")


# LOTR fun ----------------------------------------------------------------



fship <- read_csv("https://raw.githubusercontent.com/jennybc/lotr-tidy/master/data/The_Fellowship_Of_The_Ring.csv")

ttow <- read_csv("https://raw.githubusercontent.com/jennybc/lotr-tidy/master/data/The_Two_Towers.csv")

rking <- read_csv("https://raw.githubusercontent.com/jennybc/lotr-tidy/master/data/The_Return_Of_The_King.csv")

lotr <- bind_rows(fship, ttow, rking)
lotr
fship_no_female <- fship |> 
  select(Male, Film, Race)

bind_rows(fship_no_female, ttow, rking)## just sticking a column onto a data set is quite dangeorus (would be creating nonsense)
## IT IS A VERY BAD IDEA TO ADD COLUMNS 

## if whatever we want to add can be a fucntion of other data in our dataset, then we can use mutate

## jointfucntions in th tidyverse come in 
## 2 times of joint functions 
## mutating joints, which add variables to one data from from matching observations in another
## filtering joints, which filter observations from one data framed based on wheter or not they match an observatoin in another 

#KEYS: a primary key is a veriable or set of varibls that uniquely identifies each observation
# a foreign key is a veraible that corresponds to a primary key in another tbale 


# Row-Binding -------------------------------------------------------------


lotr <- bind_rows(fship, ttow, rking)
lotr
fship_no_female <- fship |> 
  select(Male, Film, Race)

bind_rows(fship_no_female, ttow, rking)## just sticking a column onto a data set is quite dangeorus (would be creating nonsense)
## IT IS A VERY BAD IDEA TO ADD COLUMNS 













# Joint functions ---------------------------------------------------------


flights
view(flights)

view(airports)
airlines ##2 variable has a code and an airline name 
airports ## has the faa code for each airport 

planes |> 
  count(tailnum) |> ## how can we check for uniqueness for our keys? 
  filter(n > 1)


planes |> 
  count(year) |> 
  tail() ## lets us see overlap 

### snake_case is standard in tidyverse betterthan LowerCase
## use nouns for objects and verbs for functions 
# "mutate" "filter" and "arrange" are all vers for functions 

## always putting space on any time of operator 

#Strive for 
#2 <- (a + b)^2 / d 

#each step on a different line (i think you're good at this one)

view(weather)

weather |> 
  count(time_hour, origin) |> 
  filter(n > 1)

planes |> 
  filter(is.na(tailnum))

flights2 <- flights |> 
  select(year:day, hour, origin, dest, tailnum, carrier)

airlines

flights2 |> 
  left_join(airlines)

flights2 |> 
  left_join(weather)


planes

flights2 |> 
  left_join(planes)
#joining by combination of join_by and tail number 

flights2 |> 
  left_join(planes, join_by(tailnum), suffix = c("flights", "planes"))

flights2 |> 
  left_join(airports, join_by(origin == faa))

flights2 |> 
  left_join(airports, join_by(orgin ))

airports2 <- airports |> 
  select(faa, name, lat, lon)

## pull in by orgin and by desitnatoin
## if we want to mull in multiple variables then we need to pull in in more of a steep wise way 

flights2 |> 
  left_join(airports2, join_by(origin == faa)) |> 
  left_join(airports2, join_by(dest == faa), suffix = c("_origin", "_dest"))
##but for each flight we hafve to load th eorgin airport and the destinatoin airport 

## next week, we'll talk about iterations 

### NOTES ON JOINS
# keys (primary key uniquely identifies an observatoin in its own table)
## Keys (foreign key) is a vairable that corresponds to a pimrary key in another table 
## understanding joints 
# Left joins should be our default 
#filteering joins 

airports |> 
  semi_join(flights2, join_by(faa == origin))

## where these semi_join fcns become super useful is when we're filtering on combinatoin
## opposite of a semi_join is an anti_join (Retain only records that don't match)

flights2 |> 
  anti_join(airports, join_by(dest == faa)) |> ## all the flights that were to airports not listed in airports dataframe 
  distinct(dest) ## gives us the unique value foer the variable 
## just so we don't get missing data that we didn't know was missing 
# if we don't we can quickly get a list of them that way 


## task is to "filter flights to only show planes that have shoed at least 100 flights) 



planes_gt100 <- flights2 |> 
  group_by(tailnum) |> 
  summarize(count = n()) |> 
  filter(count > 100) 


flights |> 
  semi_join(planes_gt100)

## now we have a subseted table with only flgihts that have flown > 100 flights. I see why this could be quite important

planes_gt100

## or 


## how do i subset my flights ? 

## i want to count the number of lines that each tail number is countered in 



## we could aos be many-to-many
# we just need to be mindful of what those relationships are
# if we run into probelms with joining... ceck 
# check that none of the varaibles in the primary key are missing 
# check that your foreign keys match primary keys in another tabler. the best way to do this is with an anti_join()
# 






