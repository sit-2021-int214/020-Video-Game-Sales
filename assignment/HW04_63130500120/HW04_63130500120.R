#install lib
install.packages("dplyr")
install.packages("readr")
install.packages("ggplot2")

#load lib
library(dplyr)
library(readr)
library(ggplot2)

#import datasets
top_cs <- read_csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/prog_book.csv")

#Explore dataset
glimpse(top_cs)

# Part 2
# 1
top_cs %>%
  filter(Type == 'Hardcover') %>%
  filter(Rating == max(Rating)) %>%
  select(Book_title,Rating)

# 2
top_cs %>% 
  slice(1:10) %>%
  select(Book_title)

# 3
top_cs %>%
  mutate(Rating/Reviews)

# 4
top_cs %>% 
  arrange(Price) %>%
  slice(1:5)

# 5 
top_cs %>% relocate(Book_title)

# Part 3
