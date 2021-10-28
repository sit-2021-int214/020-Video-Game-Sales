#install lib
install.packages("dplyr")
install.packages("readr")
install.packages("stringr")
install.packages("assertive")
install.packages("ggplot2")

#load lib
library(dplyr)
library(readr)
library(stringr)
library(assertive)
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
# 1
top_cs %>% filter(Rating>min(Rating)) %>%
  filter(Reviews>200) %>% filter(Type=="Hardcover")
# 2
top_cs %>% select(Book_title, Rating, Price) %>%
  filter(Rating < 4.5) %>% slice_min(Price)


# Part 4
ggplot(top_cs,aes(x=Type,fill=Type)) + geom_bar() +
  scale_fill_hue(c = 100,200,30) 

scat_plot <- top_cs %>% filter(Price<180) %>% ggplot(aes(x=Price,y=Reviews))+
  geom_point(aes(color=Type))
scat_plot+geom_smooth()

