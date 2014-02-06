library(parallel)
library(snow)

cat("\014")
rm(list=ls())
closeAllConnections()
setwd("C:/Users/devganesh/Desktop/STA 250/Delays data/Delays CSV files")
source("C:/Users/devganesh/Desktop/STA 250/HW2 code/getFreqTable.R")

c1 = makeCluster(2, "SOCK")
filenames<-list.files(full.names=TRUE)
g<-clusterSplit(c1, filenames)

Sys.time()

freqtables<-clusterApply(c1, g,  getFreqTable, TRUE) 

Sys.time()



stopCluster(c1)

rm(c1)
closeAllConnections()


mean=sum(statsTable$value*statsTable$frequency)/20161

sd=sqrt(sum(statsTable$frequency*(statsTable$value-mean)^2)/(sum(statsTable$freq)-1))

