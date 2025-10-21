titanic <- read.table
Titanic$PClass <- factor(Titanic$Sex)
Titanic$SurvivedFactor <- factor(Titanic$Survived),
levels=c("0","1")
labels=c("No","yes")
table(titanic$SurvivedFactor)
table(titanic$SurvivedFactor, titanic$sex) 
table(titanic$Sex, titanic$survivedFactor)
tbl <- table(titanic$Sex, titanic$SurvivedFactor) # save in table variable                  


## histogram of one continuous numerical variable 
hist(titanic$age)
hist(titanic$Age, breaks = 30)

