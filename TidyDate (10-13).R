ibrary(tidyverse)


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

table4a
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
                          