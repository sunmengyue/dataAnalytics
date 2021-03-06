data(iris)
library(class)

## Split in train + test set
idxs <- sample(1:nrow(iris),as.integer(0.7*nrow(iris)))
trainIris <- iris[idxs,]
testIris <- iris[-idxs,]

## A 3-nearest neighbours model with no normalization
nn3 <- knn(Species ~ .,trainIris,testIris,norm=FALSE,k=3)

## The resulting confusion matrix
table(testIris[,'Species'],nn3)

## Now a 5-nearest neighbours model with normalization
nn5 <- kNN(Species ~ .,trainIris,testIris,norm=TRUE,k=5)

## The resulting confusion matrix
table(testIris[,'Species'],nn5)