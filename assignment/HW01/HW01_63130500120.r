#EXERCISE0
#Operation
X <- 3
Y <- 5
print(x + y)
print(x - y)
print(x * y)
print(x / y)

#Data
varA <- 5
varB <- TRUE
varC <- "string"
class(varA)
class(varB)
class(varC)

#Vector
c(1,2,3,4)

#Operation with Vector
v1 <- (1:5)
v2 <- (1:10)
v1+v2

#Exercise 1
data <- c(10.4, 5.6, 3.1, 6.4, 21.7)

mean(data)
sum(data)
median(data)
sd(data)
var(data)

#Exercise2
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

# Or using Function
years <- c(2008,2008,2010,2011,2011,2012,rep(2013:2016,each=2),
           rep(2017,4),rep(2018,2),rep(2019,3),rep(2021,4))

#dataframe_marvel
marvel_movies <- data.frame(names,years)
marvel_movies

#The numbers of movies
length(marvel_movies)

#19th_movies
marvel_movies[19]

#most released movies ans : 2018 , 2021
table(years)