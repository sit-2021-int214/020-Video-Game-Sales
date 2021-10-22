#Data Cleaning and Data Transformation 

#Step 1. Loading library 

install.packages("dplyr")
install.packages("readr")
install.packages("stringr")
install.packages("assertive")
install.packages("DescTools")

library(dplyr)
library(readr)
library(stringr)
library(assertive)
library(DescTools)

#Step 2. Loading datasets

games <- as_tibble(read.csv("https://raw.githubusercontent.com/sit-2021-int214/020-Video-Game-Sales/main/resources/vgsales.csv"))
glimpse(games)
