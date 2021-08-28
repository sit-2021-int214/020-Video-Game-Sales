#Exercise 1

varient <- c(10.4,5.6,3.1,6.4,21.7)
#average or mean
a <- mean(varient)
a
#sum
b <- sum(varient)
b
#median
c <- median(varient)
c
#sd
d <- sd(varient)
d
#var
e <- var(varient)
e

#Exercise 2

# List of Marvel movies (Order by Marvel Phase released)
names <- c("Iron Man","The Incredible Hulk","Iron Man 2","Thor","Captain America: The First Avenger",
           "The Avengers","Iron Man 3","Thor: The Dark World","Captain America: The Winter Soldier",
           "Guardians of the Galaxy","Avengers: Age of Ultron","Ant-Man","Captain America: Civil War",
           "Doctor Strange","Guardians of the Galaxy 2","Spider-Man: Homecoming","Thor: Ragnarok","Black Panther",
           "Avengers: Infinity War","Ant-Man and the Wasp","Captain Marvel","Avengers: Endgame",
           "Spider-Man: Far From Home","WandaVision","Falcon and the Winter Soldier","Loki","Black Widow")

# List of released year of Marvel movies
years <- c(2008,2008,2010,2011,2011,2012,2013,2013,2014,2014,2015,2015,2016,2016,
           2017,2017,2017,2017,2018,2018,2019,2019,2019,2021,2021,2021,2021)

#Marvel movies
marvel_movies <- data.frame(names, years)
marvel_movies
#use the data frame because it's easy to read and show the movies that released in each years correctly and easy to read again <3

#The numbers of movies
length(names)
#or
nrow(marvel_movies)

#Finding the 19th movies name
names[19]

#Which year is most released movies (In this question can using observation data, not necessary to used command to find answer)
View(marvel_movies)
#or
table(years)
#answer : 2017 and 2021