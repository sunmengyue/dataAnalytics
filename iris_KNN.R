data(iris)
str(iris)
#predict species based on the other 4 numeric features
table(iris$Species)
head(iris)
#1st mix up the rows so that species are not grouped
set.seed(9850)#we are going to use random generators
gp <- runif(nrow(iris))
iris <- iris[order(gp), ]
head(iris, 15)
str(iris)
summary(iris[, c(1:4)])
#pay attention to the min and max in each feature. We know that we need to do some normalization
#the min-max normalization will give a group of number ranging from 0 to 1
normalize <- function(x) {
  return( (x - min(x)) / ( max(x) - min(x) ) )
}
#try normalize(c(1:5))

irisn <- as.data.frame(lapply(iris[, c(1:4)], normalize))
head(irisn)
str(irisn)
summary(irisn)

#seperate the training and test dataset
irisTrain <- irisn[1 : 129, ]
irisTest <- irisn[130 : 150, ]
irisTrainTarget <- iris[1 : 129, 5]
irisTestTarget <- iris[130 : 150, 5]
library(class)
#get the k. It is better to use an odd number
m1 <- knn(train = irisTrain, test = irisTest, cl = irisTrainTarget, k = 13)
# what stored in m1 is the prediction of all the values in the test dataset
#now draw a confusion matrix
table(irisTestTarget, m1)
#the diagnal from left top to the right bottom are correctly predicted numbers. Values fall beyond the area
  #are not correctly predicted. In our case, 2 virginica were actually versicolor
