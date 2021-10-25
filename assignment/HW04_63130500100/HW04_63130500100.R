#Part1
# Library
library(janitor)
library(dplyr)
library(stringr)
library(tidyr)
library(assertive)
library(readr)
library(psych)
library(data.table)
library(ggplot2)

# Dataset
com_science  <- read.csv("C:/Users/Admin/Desktop/int214/prog_book.csv")

glimpse(com_science)

#Part2
com_science %>% select(Rating,Book_title)

str_sort(com_science$Rating)

#Part3
#1 ¤èÒà©ÅÕèÂ¢Í§ÃÒ¤ÒË¹Ñ§Ê×Í·Ñé§ËÁ´ áÅÐË¹Ñ§Ê×Í·ÕèÁÕÃÒ¤Òá¾§·ÕèÊØ´ª×èÍÍÐäÃ ÃÒ¤Òà·èÒäËÃè
mean(com_science$Price)
com_science %>% select(Book_title,Price) %>% filter(Price == max(Price))

#2 Ë¹Ñ§Ê×Í·ÕèÁÕ Rating µèÓ¡ÇèÒ 4 ÁÕ¡ÕèàÅèÁ
lessthan4 <- filter(com_science,Rating < 4)
count(lessthan4)

#3 ÁÕË¹Ñ§Ê×Í»ÃÐàÀ·ÍÐäÃºéÒ§ áÅÐáµèÅÐ»ÃÐàÀ·ÁÕË¹Ñ§Ê×Í·Ñé§ËÁ´¡ÕèàÅèÁ
com_science %>% distinct(Type)
amount_book <- com_science %>% count(com_science$Type)
amount_book

#4 Ë¹Ñ§Ê×Í·ÕèÁÕ¤¹ review à·èÒ¡Ñº 0 ÁÕ¡ÕèàÅèÁ àÅèÁäË¹ºéÒ§
review0 <- com_science %>% select(Book_title,Reviews) %>% filter(com_science$Reviews == 0)
review0
count(review0) %>% rename(amount = n)

#5 ¤èÒà©ÅÕèÂ¨Ó¹Ç¹Ë¹éÒË¹Ñ§Ê×Í áÅÐË¹Ñ§Ê×Í·ÕèÁÕË¹éÒ¹éÍÂ·ÕèÊØ´¤×ÍÍÐäÃ
mean(com_science$Number_Of_Pages)
com_science %>% select(Book_title,Number_Of_Pages)%>%filter(Number_Of_Pages == min(Number_Of_Pages))

#6 Ë¹Ñ§Ê×Í·ÕèÁÕÃÒ¤ÒÁÒ¡¡ÇèÒÃÒ¤Òà©ÅÕèÂÁÕ·Ñé§ËÁ´¡ÕèàÅèÁ
moreThan_mean <- com_science %>% select(Price) %>% filter(Price > mean(com_science$Price))
count(moreThan_mean)

#Part4
#¡ÃÒ¿áÊ´§¨Ó¹Ç¹Ë¹Ñ§Ê×ÍáµèÅÐ Type
ggplot(com_science,aes(x=Type)) + geom_bar()

#¡ÃÒ¿áÊ´§Ë¹Ñ§Ê×Í·ÕèÁÕ¨Ó¹Ç¹Ë¹éÒÁÒ¡¡ÇèÒ 1500 Ë¹éÒ
com_science %>% filter(Number_Of_Pages > 1500) %>% ggplot(aes(x=Book_title, y=Number_Of_Pages))+geom_point()+ggtitle("Amount of Page more than 1500")
