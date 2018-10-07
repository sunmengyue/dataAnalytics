#Data transforms
train <- read.csv("/Users/sunmengyue/Dropbox/2. Northeastern Unviersity/Fall2018/DA 5030 DataMining and Machine Learning/week4/ml_book_ch3_foods.csv")
minSweetness <- min(train$sweetness)
maxSweetness <- max(train$sweetness)
minSweetness
maxSweetness
#transfrom the sweetness for apple using min max normalization
train$sw <- (train$sweetness - minSweetness) / (maxSweetness - minSweetness)
train

#Z-score normalization
meanCrunch <- mean(train$crunchiness)
meanCrunch
sdCrunch <- sd(train$crunchiness)
sdCrunch
train$cr <- (train$crunchiness - meanCrunch) / sdCrunch
train
