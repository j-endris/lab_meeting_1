#lab_meeting_assignment
#Joe Endris

library(dplyr)
library(ggplot2)


climate <-read.csv("clarksville_climate.csv")

glimpse(climate)
head(climate)

#scatterplot for temperature max per day
ggplot(climate)+
  geom_point(aes(x=DATE, y=TMAX),color=as.factor(), size=1)
  theme_bw()+
  xlab("Date")+
  ylab("Temperature")+
    ggtitle("Temperature Minimum and Maximum by Date")

  
monthly_mean <- montly_mean %>%
  group_by(month) %>%
  summarize(mean_temp = mean(TMAX))
