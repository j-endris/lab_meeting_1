library(dplyr)
library(tidyr)
library(ggplot2)

baseline<-read.csv('baseline.csv')


#find row averages of column 3 and 4
data$new <- rowMeans(baseline[ , c(3,4)], na.rm=TRUE)

#ggplot(compensation, aes(x = Root, y = Height,shape=Species, color=Species)) +
  geom_point()+
  xlab("Stem Mean Diameter")+
  ylab("Seedling Height")+
  theme_bw()


  