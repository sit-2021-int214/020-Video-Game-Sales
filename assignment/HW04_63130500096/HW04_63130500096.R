#Part1
#Library
library(janitor)
library(dplyr)
library(stringr)
library(tidyr)
library(assertive)
library(readr)
library(psych)
library(data.table)

#Dataset
Prog_Books <- read.csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/prog_book.csv")

glimpse(Prog_Books)

#Part2
#Function select() from package dplyr).
Prog_Books %>% select(Book_title,Number_Of_Pages)

#Function as_tibble() from package tidyr.
as_tibble(Prog_Books)

#Part3
#1.หนังสือที่มีราคาแพงที่สุด คือ เล่มใดและเป็นประเภทอะไร
Prog_Books%>%select(Book_title,Type,Price) %>% 
  slice_max(Price)
#จากผลลัพธ์แสดงให้เห็นว่า หนังสือที่มีราคาแพงที่สุด คือ A Discipline for Software Engineering เป็นประเภท Hardcover

#2.หนังสือเล่มใดที่มี Rating มากกว่า 3.50
Prog_Books %>% filter(Rating > 3.50) %>%
  select(Book_title,Rating)
#จากผลลัพธ์แสดงให้เห็นว่า หนังสือที่มี Rating มากกว่า 3.50 มีจำนวน 260 เล่ม

#Part4
# Create graph
library(ggplot2)

#1.แสดง Price ของหนังสือทั้งหมด
ggplot(Prog_Books,aes(x=Price)) + geom_bar()

#2.ggplot(Prog_Books,aes(x=Price,y=Reviews))+geom_point(aes(color=Reviews))
ggplot(Prog_Books,aes(x=Price,y=Reviews))+geom_point(aes(color=Reviews))
