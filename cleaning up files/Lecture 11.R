library(tidyverse)
library(readxl) ##install.packages("readxls")
library(googlesheets4) #install.packages("googlesheets4")
library(janitor) ##install.packages("janitor") GREAT package for cleaning up messy data 


#look at reading datafiles into r
## dcore functions are read_csv() and read_fwf() 

  
fship <- read_csv("https://raw.githubusercontent.com/jennybc/lotr-tidy/master/data/The_Fellowship_Of_The_Ring.csv")

ttow <- read_csv("https://raw.githubusercontent.com/jennybc/lotr-tidy/master/data/The_Two_Towers.csv")

rking <- read_csv("https://raw.githubusercontent.com/jennybc/lotr-tidy/master/data/The_Return_Of_The_King.csv")

lotr <- read_csv("https://raw.githubusercontent.com/jennybc/lotr-tidy/master/data/lotr_tidy.csv")

write_csv(lotr, file= "data/lotr.csv")

lotr <- read.csv("data/lotr.csv")

## Keep the raw data raw 

?read_csv

lotr <- read_csv("data/lotr.csv", skip = 1) 
  
## reading from Excel

lotr <- read_xlsx("data/data_lesson11.xlsx", sheet= "FOTR")


lotr_google <- read_sheet("https://docs.google.com/spreadsheets/d/1X98JobRtA3JGBFacs_JSjiX-4DPQ0vZYtNl_ozqF6IE/edit?gid=0#gid=0",
                          sheet="deaths",
                          range = "A5:F15"
lotr_google
gs4_deauth()


msa <- read_tsv("https://raw.githubusercontent.com/nt246/NTRES-6100-data-science/main/datasets/janitor_mymsa_subset.txt")

##Snake_Case lower_snake
##Kebab-case
#camelCase
##Screaming_Snake_Case

col_names(msa)
msa_clean <- clean_names(msa, case)


##cleaning up: sometimes there is messy data 

parse_number("$100") 

parse_number("80&")

#parse_number("It cost $100")

##working on Parse frunctions  
##numbers are often surronded by other characters that provide some context like $1000 or 10%

# 1,23 

parse_double("1,23", locale = locale(decimal_mark = ","))
parse_number("123.456")

mess <-  read_tsv("https://raw.githubusercontent.com/nt246/NTRES-6100-data-science/refs/heads/main/datasets/messy_data.tsv", 
                locale = locale(decimal_mark = ","))

mess = read_tsv("https://raw.githubusercontent.com/nt246/NTRES-6100-data-science/refs/heads/main/datasets/messy_data.tsv", 
                locale = locale(decimal_mark = ","),
                na = c("Missing", "N/A"))



