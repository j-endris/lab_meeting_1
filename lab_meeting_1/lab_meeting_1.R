#lab_meeting_assignment
#Joe Endris

library(dplyr)
library(ggplot2)
library(gridExtra)

raw_climate <-read.csv("clarksville_climate.csv")

#clean shop, happy shop
clean_TMAX <- filter(raw_climate,TMAX !="")
clean_TMIN <- filter(clean_TMAX,TMIN !="")
climate <- filter(clean_TMIN, YEAR !="")

glimpse(climate)
head(climate)

#create mean TMIN/TMAX by month
monthlyTMAX <- climate %>%
  group_by(MONTH) %>%
  summarise(meanTMAX = mean(TMAX),
            sdTMAX = sd(TMAX))

monthlyTMIN <- climate %>%
  group_by(MONTH) %>%
  summarise(
    meanTMIN = mean(TMIN),
            sdTMIN = sd(TMIN))


#plot monthly mean TMAX/TMIN
monthlyTMAX_plot <- ggplot(monthlyTMAX, aes(x= MONTH, y=meanTMAX))+
  geom_point(size=2, color="red")+
  xlab("Month")+
  ylab("Temperature")+
  ggtitle("Monthly Mean Maximum Temperature")

monthlyTMIN_plot <- ggplot(monthlyTMIN, aes(x= MONTH, y=meanTMIN))+
  geom_point(size=2, color="blue")+
  xlab("Month")+
  ylab("Temperature")+
  ggtitle("Monthly Mean Minimum Temperature")

grid.arrange(monthlyTMAX_plot, monthlyTMIN_plot)

#create mean TMIN/TMAX by year
annualTMAX <-climate %>%
  group_by(YEAR) %>%
  summarise(meanTMAX = mean(TMAX),
            sdTMAX = sd(TMAX))

annualTMIN <-climate %>%
  group_by(YEAR) %>%
  summarise(
    meanTMIN = mean(TMIN),
    sdTMIN = sd(TMIN))


#plot annual mean TMAX/TMIN
annualTMAX_plot <- ggplot(annualTMAX, aes(x= YEAR, y=meanTMAX))+
  geom_point(size=2, color="red")+
  xlab("Year")+
  ylab("Temperature")+
  ggtitle("Annual Mean Maximum Temperature by Year")

annualTMIN_plot <- ggplot(annualTMIN, aes(x= YEAR, y=meanTMIN))+
  geom_point(size=2, color="blue")+
  xlab("Year")+
  ylab("Temperature")+
  ggtitle("Annual Mean Minimum Temperature by Year")

grid.arrange(annualTMAX_plot, annualTMIN_plot)

#ggplot for temperature max per day
ggplot(climate, aes(x=DATE))+
  geom_point(aes(y=TMAX), color="red", size=1)+
  geom_point(aes(y=TMIN), color="blue", size=1)+
  theme_bw()+
  xlab("Date")+
  ylab("Temperature")+
  ggtitle("Temperature Minimum and Maximum by Date")

