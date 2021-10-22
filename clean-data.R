#Step 1. Loading library 
library(dplyr)
library(readr)
library(stringr)
library(assertive)
library(DescTools)

#Step 2. Loading datasets
games <- as_tibble(read.csv("C:/Users/HP/OneDrive/เอกสาร/R-int124/vgsales.csv"))
glimpse(games)


#Step 3. Changing type (แปลงเป็น factor)

games$Publisher <- as.factor(games$Publisher)
summary(games$Publisher)

games$Genre <- as.factor(games$Genre)
summary(games$Genre)

games$Year <- as.factor(games$Year)	
summary(games$Year)

games$Platform <- as.factor(games$Platform)
summary(games$Platform)


#Step 4.. Eliminate the N/A year (ลบ N/A ออก)

games <- games %>% filter(Year != "N/A")

