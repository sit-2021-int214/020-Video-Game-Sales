# Part 1: Explore the dataset
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

# Load data
market <- read.csv("/Users/kantapontantrapornpong/Downloads/superstore_sales.csv")

# Show data 
glimpse(market)
View(market)

# Part 2: Learning function from Tidyverse
#2.1 Function select() from package dplyr). It using for select columns
market %>% select(Product.ID,Sales)

#2.2 Function str_length() from package Stringr). It using for show length of data.
str_length(market$Customer.Name) 
 
#2.3 Function str_c() from package Stringr). It using for list data and separate by comma.
str_c(market$Row.ID, collapse = ", ")

#Part 3: Transform data with dplyr and finding insight the data
#1. สินค้าใดบ้างมีราคามากกว่าราคาเฉลี่ยของสินค้าทั้งหมด (แสดงเฉพาะรหัสสินค้า) 
product <- market%>%select(Product.ID,Sales)%>%filter(market$Sales > mean(market$Sales))
product

#2. Customer คนไหนบ้างที่อยู่ใน United State
customer_us <- market%>%select(Customer.Name)%>%filter(market$Country == "United States")%>%distinct
customer_us

#3. สินค้าทั้งหมดมีกี่ประเภทมีอะไรบ้าง และ แต่ละประเภทมีสินค้่ามีจำนวนเท่าไหร่
product_category_num <- count(market %>%distinct(Category))%>%rename(NumberOfCategory = n)
product_category_num
prduct_category <- market %>%count(market$Category)%>% rename(AmountOfCategory = n)
prduct_category

#4. สินค้าใดบ้างที่ขายในรัฐ Texas
product_texas <- market%>%select(Product.ID)%>%filter(market$State == "Texas")
product_texas

#5. ในแต่ละวันมี Order สินค้าเท่าใด
market %>% count(Order.Date)

#6. order ใดบ้างที่มีการขนส่งแบบ first class
market %>% select(Order.ID)%>%filter(market$Ship.Mode == "First Class")%>%distinct

#Part 4: Visualization with GGplot2
#1 Graph show relation between Product ID and sales more than 12,500
market %>% filter(Sales > 12500)%>%ggplot(aes(x=Product.ID, y=Sales))+geom_point()+ ggtitle("Product that have a sales more than 12500 ")

#2 Graph show product Id and shipping date that have customer name Corey Roper
market %>% filter(Customer.Name== "Corey Roper")%>%ggplot(aes(x=Product.ID, y=Ship.Date))+geom_point()+ ggtitle("Product and Shipping Date that have customer name Corey Roper")




