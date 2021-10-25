#Explore the dataset
#Install Package
install.packages("dplyr")
install.packages("DescTools")

#Loading package
library(dplyr)
library(DescTools)

#Load data
storesales <- read.csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/superstore_sales.csv")

#Explore data
View(storesales)
#or
glimpse(storesales)

#Cleaning data
#Rename
sales <- storesales
sales <- sales %>% rename(Row = Row.ID)
sales <- sales %>% rename(ProductName = Product.Name)

#Changing types of values
sales$Row <- as.character(sales$Row)
sales$Postal.Code <- as.character(sales$Postal.Code)

#Show result cleaned data
glimpse(sales)


#Learning function from Tidyverse
#Install Package
install.packages("tidyverse")

#Loading package
library(tidyverse)

#Function summarize_if() from dplyr summarize the whole data with condition
#Summarize mean of all columns that are numeric
sales %>% summarize_if(is.numeric,mean)
#Summarize max of all columns that are numeric
sales %>% summarize_if(is.numeric,max)
#Summarize min of all columns that are numeric
sales %>% summarize_if(is.numeric,min)

#Function as_tibble() from tidyr is data frame that is designed for presentation
as_tibble(sales)

#Function pivot_longer() from tidyr is change data in to a long form
descsales <- sales %>% pivot_longer(cols = Product.ID:ProductName, names_to = "description", values_to = "value")
#View the data in the long form
glimpse(descsales)

#Function pivot_wider() from tidyr is convert data back to the wide form
descsales <- descsales %>% pivot_wider(names_from = "description", values_from = "value")
#View the data in the wide form
glimpse(descsales)


#Transform data with dplyr and finding insight the data
#1. What is the highest price in each category?
sales %>% group_by(Category) %>% summarize(max_price = max(Sales))

#2. What is the total sales amount?
sales %>% summarise(sumsales = sum(Sales))

#3. Find the city that bought the chairs.
sales %>% filter(Sub.Category == "Chairs") %>% distinct(City)

#4. Find the product name that ordered in 08/08/2017
sales %>% filter(Order.Date == "08/08/2017") %>% select(ProductName)

#5. What state is the most ordering?
Mode(sales$State)

#6. Show 10 ranks of customer names that have the most purchase.
sales %>% select(Customer.Name, ProductName, Category, Sales) %>% slice_max(Sales, n=10)

#7. Find the product name that in furniture category and have sales more than 3000
sales %>% select(ProductName, Category, Sales) %>% filter(Category == "Furniture" & Sales > 3000)


#Visualization with GGplot2
#1.Graph show sales of technology category each sub category.
plot1 <- sales %>% filter(sales$Category == "Technology") %>% ggplot(aes(x = Row, y= Sales)) + geom_point(aes(Sub.Category), color = "#ff8070") + ggtitle("Sales of technology category each sub category")

plot1

#2. Show the pie chart that show the most sold categories products.
x <- sales %>% count(Category) %>% filter(n >= 0) %>% select(n)
price <- as.double(unlist(x))
cate <- sales %>% count(Category) %>% select(-n)
cat <- as.character(unlist(cateandsub))

piechart <- pie(price, cat)
