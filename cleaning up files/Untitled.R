library(openintro) #install.packages("openintro")

## 95% I is x 
ages <- run12$age
hist(ages)
sigma <- sd(ages)
population_mean <- mean(ages)
mu <- populatoin_mean <- mean(ages)
population_mean

n <- 42

#sample 42 runners, compute the smample agerage 
# age and construct CI
sample_ages <- sample(ages, size = n )
sample_agea