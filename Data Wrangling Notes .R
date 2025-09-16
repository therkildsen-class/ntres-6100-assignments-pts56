#Data Wrangling 
## WE NEVER TOUCH THE RAW DATA
#if we go an manually edit excel file then we never have a record
#take messy data and use code to restructure it 

library(tidyverse) #building good habits by loading package at beginning of script 
library(skimr) #install.packages("skimr")
coronavirus <- read_csv('https://raw.githubusercontent.com/RamiKrispin/coronavirus/master/csv/coronavirus.csv')

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

filter(coronavirus, country%in%c("Germany","Austria","Poland"), type=="death", date=="2021-09-16")#filder does rows

#select does columns 
select(coronavirus, date, country, type, cases) ## how to select specific columns THE ORDER HERE MATTERS
select(coronavirus, -province)

## Excersize #2 

select(coronavirus, country, lat, long)
select(coronavirus, lat, long, country)


View(count(coronavirus, country))## see how it spells different countries 


