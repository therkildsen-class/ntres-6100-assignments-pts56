#Data Wrangling 
## WE NEVER TOUCH THE RAW DATA
#if we go an manually edit excel file then we never have a record
#take messy data and use code to restructure it 


library(tidyverse) #building good habits by loading package at beginning of script 
library(skimr) #install.packages("skimr")
library(dplyr)
coronavirus <- read_csv('https://raw.githubusercontent.com/RamiKrispin/coronavirus/master/csv/coronavirus.csv')
vacc <- read_csv("https://raw.githubusercontent.com/RamiKrispin/coronavirus/main/csv/covid19_vaccine.csv")

## list of handy functions to view data 
summary(coronavirus) #helpful way to initially view data 
skim(coronavirus) #must load skimr in library
view(coronavirus) #opens a new tap.
head(coronavirus) #just opens the first few rows 
tail(coronavirus) #opens the last  rows 


coronavirus$cases#when run this then will only get vector 
head(coronavirus$cases) #typically in tidyverse we don't have to use this $ notation 

#dplyr is a fuction we use a lot
# 5 functions 
#filter()
#select(): pick variables by their names 
#mutate(): create new variables with functions of extincting variables 
#arrange(): reorder the rows
#summarize(): collapse many values down to single summary 
#arrange(): reorder the rows 
#summarize(): collapse many values down to a single summary 




filter(coronavirus, cases > 0) #fcn to filter out data points without COVID case #'s 

filter(coronavirus, country=="US")#in r functions "=" assign values. when using a logical statement then we use "=="
filter(coronavirus, country!="US") # in r functions "!=" is "anything but" 

coronavirus_US <- filter(coronavirus, country=="US") ## creating new data set for US

filter(coronavirus, country=="US" | country=="Canada") ## record from US OR Canada 
## we could also write this like....
filter(coronavirus, country%in%c("US","Canada")) # if we are matching to multiple items in a string we have to use the included in operator 


filter(coronavirus, country=='US' & type=="death") ## record of Death cases from the US

##Exercise 1: What is the total number of deaths in the US included in this dataset 
#1b: Subset the dta to nly show the death counts in European countries on today's date io 2021 

filter(coronavirus, country%in%c("Germany","Austria","Poland"), type=="death", date=="2021-09-16")#filter does rows

#select does columns 
select(coronavirus, date, country, type, cases) ## how to select specific columns THE ORDER HERE MATTERS
select(coronavirus, -province)

## Excersize #2 

select(coronavirus, country, lat, long)
select(coronavirus, lat, long, country)
select(coronavirus, date:cases)
select(coronavirus, 1:3)
View(count(coronavirus, country))## see how it spells different countries 
select(coronavirus, contains('y'), everything()) ## "Reorder" and "Rename" are also quite helpful 

filter(coronavirus, country%in%c("US"))
coronavirus_US <- filter(coronavirus, country%in%c("US")) 

#select(coronavirus_US, -lat, -long, -province) ### - means drop  
#coronavirus_US <- select(coronavirus_US, -lat, -long, -province) ### - means drop  

## really important idea of tidyverse coding is the idea of using a pipe operator 

|> ### keyboard shotcut is shift+command+m "and then" 
  
coronavirus |> #"and then" 
  filter (country == "US") |>
  select(-lat, -long, -province) #line breaks don't matter but makes code a lot more readable. new operaroin per line

#without the pipe we have to start "nesting" functions within themselves 

## use pipe function to only inlcude death counts in Us, Canada, Mexico

coronavirus |> #"and then"
  filter(type=="death",  ## remember to use == when filtering by type
         country %in%c("US", "Mexico", "Canada")) |>  ## by death
  select(country, date, cases) |> # here we do not use quotation marks 
  ggplot() + 
  geom_line(mapping = aes(x = date, y = cases, color = country)) 


# mutate() function ... adds new variables 

vacc |> 
  filter(date == max(date)) |> # "hard code" means typing a specific text string 
  select(country_region, continent_name, people_at_least_one_dose, population) |> 
  mutate(vaxxrate = round(people_at_least_one_dose / population, 2)) #the fist argument it needs is "what it is operating on"
## mutate function creates a new variable 


Exercise 2 
#add a new varibles that shows how many doses of vaccine on agerage have been distributed per country
#make a new variable, # of doses adinstrated/poeple with at least one dose()
vacc |> 
  filter(date==max(date)) |> 
  select(country_region, continent_name, people_at_least_one_dose, doses_admin, population) |> 
  mutate(doses_per_vaxxed = round(doses_admin/people_at_least_one_dose, 2))|> 
  filter(doses_per_vaxxed > 3) |> 
  arrange(-doses_per_vaxxed) #"r" version of excel sort 


  filter(doses_admin > 200 * 10^6) |> 
  ggplot() + 
  geom_histogram(mapping = aes( x=doses_per_vaxxed)
  

 #Exercise 3> which countries have the higest vaccination rates 
#what is the variable we need to create in order to answer this question? 
vacc |> 
  filter(date==max(date)) |> 
  select(country_region, continent_name, people_at_least_one_dose, doses_admin, population) |> 
  mutate(vaxxrate = people_at_least_one_dose/population) |> 
  filter(vaxxrate > 0.9) |> 
  arrange(-vaxxrate) |> 
  ## vaeriables are column headers and they're not going to show up in our enviorment 




# Summarize Function ---------------------------------------------------------------- 



coronavirus |> 
  filter(type== "confirmed") |>  
  group_by(country) |> 
  summarize(total =sum(cases)) |> 
  arrange(-total)


  



