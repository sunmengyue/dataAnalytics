library(caret)
setwd("/Users/sunmengyue/Dropbox/2. Northeastern Unviersity/Fall2018/DA 5030 DataMining and Machine Learning/data analytics")
dataurl <- "https://archive.ics.uci.edu/ml/machine-learning-databases/wine/wine.data"
download.file(url = dataurl, destfile = "wine.data")
wine_df <- read.csv("wine.data", header = FALSE)
str(wine_df)

#Data slicing
set.seed(3033)
intrain <- createDataPartition(y = wine_df$V1, p= 0.7, list = FALSE) #target variable is at V1, not returning a list
training <- wine_df[intrain, ]
testing <- wine_df[-intrain, ]
dim(training)
dim(testing)
anyNA(wine_df)
summary(wine_df)

training$V1 = factor(training$V1)
testing$V1 = factor(testing$V1)

#Training the Knn model
#trainControl() controls the computational nuances of the train() method.
trctrl <- trainControl(method = "repeatedcv", number = 10, repeats = 3)
set.seed(3333)
knn_fit <- train(V1 ~., data = training, method = "knn",
                 trControl=trctrl,
                 preProcess = c("center", "scale"),
                 tuneLength = 10)
knn_fit
#Accuracy was used to select the largest number. 21 is selected here as the accuracy is the highest

#Test set prediction
 test_pred <- predict(knn_fit, newdata = testing)
 test_pred

 #Evaluation with Confusion Matrix
 confusionMatrix(test_pred, testing$V1)
  