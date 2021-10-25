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
#1 ค่าเฉลี่ยของราคาหนังสือทั้งหมด และหนังสือที่มีราคาแพงที่สุดชื่ออะไร ราคาเท่าไหร่
mean(com_science$Price)
com_science %>% select(Book_title,Price) %>% filter(Price == max(Price))

#2 หนังสือที่มี Rating ต่ำกว่า 4 มีกี่เล่ม
lessthan4 <- filter(com_science,Rating < 4)
count(lessthan4)

#3 มีหนังสือประเภทอะไรบ้าง และแต่ละประเภทมีหนังสือทั้งหมดกี่เล่ม
com_science %>% distinct(Type)
amount_book <- com_science %>% count(com_science$Type)
amount_book

#4 หนังสือที่มีคน review เท่ากับ 0 มีกี่เล่ม เล่มไหนบ้าง
review0 <- com_science %>% select(Book_title,Reviews) %>% filter(com_science$Reviews == 0)
review0
count(review0) %>% rename(amount = n)

#5 ค่าเฉลี่ยจำนวนหน้าหนังสือ และหนังสือที่มีหน้าน้อยที่สุดคืออะไร
mean(com_science$Number_Of_Pages)
com_science %>% select(Book_title,Number_Of_Pages)%>%filter(Number_Of_Pages == min(Number_Of_Pages))

#6 หนังสือที่มีราคามากกว่าราคาเฉลี่ยมีทั้งหมดกี่เล่ม
moreThan_mean <- com_science %>% select(Price) %>% filter(Price > mean(com_science$Price))
count(moreThan_mean)

#Part4
#กราฟแสดงจำนวนหนังสือแต่ละ Type
ggplot(com_science,aes(x=Type)) + geom_bar()

#กราฟแสดงหนังสือที่มีจำนวนหน้ามากกว่า 1500 หน้า
com_science %>% filter(Number_Of_Pages > 1500) %>% ggplot(aes(x=Book_title, y=Number_Of_Pages))+geom_point()+ggtitle("Amount of Page more than 1500")
