
require(ggplot2)
#year <- 20 #你要繳納幾年

#restyear <- 40 #繳完後還可以活多久

#yearget <- 12 #一年得到多少錢

#yearpay <- 10 #一年繳多少錢

#rate <- 0.02

npvplot <- function(yearpay=10,yearget=12,rate=0.02,year=20,restyear=40                  ){

npv<-function(yearpay=10,yearget=12,rate=0.02,year=20,restyear=40){
  
  benefit<- sum( yearget/  ( (1+rate)^seq(year-1, year+restyear-1)  ) )
  cost <- sum  (   yearpay/  ( (1+rate)^seq(0, year-1              )  ) )         
 return( benefit-cost   )
}

benefit <- vector("numeric",length = 50)

for(i in 1:50){
  
  benefit[i]<- npv(yearpay=10,yearget=12,rate=0.02,year=20,i) 
  
}

restlife <- c(1:50)
dat <- data.frame(restlife,benefit)
qplot(restlife,benefit,geom = "line")
}
npvplot()