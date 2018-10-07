setwd("/Users/sunmengyue/Dropbox/2. Northeastern Unviersity/Fall2018/DA 5030 DataMining and Machine Learning/week4")
getwd()
foodsTraining <- read.csv("ml_book_ch3_foods.csv", stringsAsFactors = FALSE)
foodsTraining
#Assume k = 4 rather than determining k with the best accuracy
unknown <- c("tomato", 7, 4) #food name, sweetness and crunchiness
m <- nrow(foodsTraining)
m

distance <- numeric(m)
distance # 15 zeros

p <- c(3, 5)
q <- c(7, 2)

#distance between p and q
getDist <- function(p, q) {
  dsq <- 0
  for (i in 1 : length(p)) {
    dsq <- dsq + (p[i] - q[i])^2
  }
   sqrt(dsq)
}

x <- getDist(p, q)
x

#For one row in the training dataset:
head(foodsTraining)
p <- foodsTraining[1, c(2, 3)] #take the first row, 2nd and 3rd column at the same time
p
q <- as.numeric(unknown[c(2, 3)])
getDist(p, q)
head(foodsTraining)

# loop through every row
getDistN <- function(training, q) {
  m <- nrow(training)
  distance <- numeric(m)
  q <- as.numeric(unknown[c(2, 3)])
  for (i in 1 : m) {
    p <- training[i, c(2, 3)]
    distance[i] <- getDist(p, q)
  }
  distance
}

n <- getDistN(foodsTraining, unknown)

#getting the k closest neighbors
findKClosest <- function(neighbors, k) {
  neighborOrder <- order(neighbors)
   neighborOrder[1 : k]
}

f <- findKClosest(foodsTraining, 4)
f
#vote
vote <- function(x) {
  ux <- unique(x)
  ux[which.max(tabulate(match(x, ux)))]
}

vote(foodsTraining$type[f])
