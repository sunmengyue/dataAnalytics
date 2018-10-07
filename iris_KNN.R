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
