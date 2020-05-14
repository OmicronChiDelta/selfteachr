library(tsibble)
library(dplyr)
library(tidyverse)
library(fpp) #Book companion
library(tsibbledata) #Toy datasets
library(feasts) #so autoplot plays nicely
library(lubridate)

### OLYMPIC RUNNING 
#Basics of selection and filtering
data = olympic_running

#Length is a factor...
cat(str(data$Length))

#So map it to a string to allow selection...
data$Length = as.character(data$Length)

#Time series of mens' 100m results 
test = data%>%filter(Length == '100m')%>%filter(Sex == 'men')%>%select(Year, Time)

#Show the time series
test%>%autoplot(Time) +
  xlab('Year') +
  ylab('Time/s') 

### AUSTRALIAN TOURISM
#Totals for each quarter by state
tots = tourism%>%
  filter(Purpose == 'Business')%>%
  group_by(State)%>%
  summarise(Total = sum(Trips))

#Raw time series
tots%>%autoplot(Total) + xlab('Calendar Quarter') + ylab('Total trips')

#Seasonal plot by quarter
tots%>%gg_season(Total) + xlab('Quarter') + ylab('Total trips')



### VICTORIA ELECTRICTY DEMAND
v = vic_elec%>%mutate(CalYear = year(Date))

#Scatter
ggplot(v, aes(Temperature, Demand)) + geom_point(aes(color='red', alpha=0.001)) + xlab('Temperature/Celsius') + ylab('Electricity Demand') + ggtitle('Correlation between temperature and electricity demand')

