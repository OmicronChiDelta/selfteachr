library(tsibble)
library(dplyr)
library(tidyverse)
library(fpp) #Book companion
library(tsibbledata) #Toy datasets

#Raw data
my_data = read_csv('C:\\Users\\Alex White\\Documents\\GitHub\\reading_buses\\extractions\\16_20200101_20200401\\arrival_history.csv')

test = my_data %>% select(LocationCode, ScheduledArrivalTime, arrival_delta)

#Check for duplicates
dups = duplicates(test, index='ScheduledArrivalTime')

#Convert to tsibble format
my_tsibble = as_tsibble(test, index=ScheduledArrivalTime)