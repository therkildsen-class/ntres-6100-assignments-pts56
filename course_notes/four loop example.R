library(tidyverse)
library(gapminder)


for(i in 1:10) {
  print(i) # whatever we do computation on... as long sas oyu do the index on the ofur loop, then ...
  
}

volumes = c(1.6, 3, 8)

for (volume in volumes){
  mass <- 2.65 * volume ^ 0.9
  print(mass)
  

}
for ( i in 1:3) { 
  mass <- 2.65 * volume ^ 0.9
  print(mass)
}



masses <- vector("numeric", length = length(volumes)) 

for ( i in seq_along(volumes)) {
  
  mass <- 2.65 * volumes[i] ^ 0.9
  print(mass)
  masses[i] <- mass
}


mass_lbs <- c(2.2, 3.5, 9.6, 1.2)
mass_kg <- vector("numeric", length(mass_lbs))

for ( i. in seq_along(mass_lbs) ){
  
  mass_kg[i] = 2.2 * mass_lbs
}


masses