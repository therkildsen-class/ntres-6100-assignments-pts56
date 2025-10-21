#Every random variable we talk about is going to have a collection of R functions
#Notes
#R Function 
 #dbinom = pmf.  P(X=x)
 #pbinom = cdf    P(X≤x)
 #qbinom = quantile fucntion  q such that P(X≤q)  p 
 #rbinom. random draw.   a random realixzation 

#(more percisley, qbinom finds smallest integer q for which P(X≤1)P)


#Assume x~Binomial (n=10, p=0.2)
#we want P(X= 3) (pmf) |> so we want to use "dbinom in r"

#dbinom( P(x=3), n=10, p=0.2)
dbinom(x=3, size=10, prob=0.2) ## can do with words
dbinom(3,10,0.2) # same function as above 
choose(10,3)*0.2^3*(1-0.2)^(10-3)# same calcuation as above 

xvalues <- 0:10
probs <- dbinom(xvalues, 10, 0.2)
barplot(probs, names.arg = xvalues) # with x lables 

# 100 trials 


xvalues <- 0:100
probs <- dbinom(xvalues, 10, 0.2)
barplot(probs, names.arg = xvalues) # with x lables 

## CDF
P(X ≤ 3) - CDF 
pbinom(3,10,0.2)


xvalues <- 0:10
probs <- pbinom(xvalues, 10, 0.2)
plot(xvalues, probs, type="o", ylim=c(0,1))# not the greatest value because the value does not change between whole numbers 



# quantile function 

qbinom(0.87, 10, 0.2)
# should be appx 

##cdf function 
pbinom(3,10,0.2)


## generate random numbers 
## four random realizations : 
rbinom(4,10,0.2) # if i run it twice i should get two different answers 
## one random realization
rbinom(1,10,0.2)


## simlation
realizations <- rbinom(10000, 10,0.2) 
sum(realizations <= 3)
sum(realizations <= 3)/10000 

