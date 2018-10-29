data(mtcars)
head(mtcars)
str(mtcars)
summary(mtcars)
hist(mtcars$mpg)# even if it is not normally distributed, it does not skewed
hist(log(mtcars$mpg))# The log transform does not work
hist(sqrt(mtcars$mpg))#not so much, so we just leave it as it is
#Next, check what does the feature am means
?mtcars
table(mtcars$vs)
table(mtcars$am)
cor(mtcars[c("mpg", "cyl", "wt", "disp", "hp", "drat", "qsec")])
#scatterplot matrix
pairs(mtcars[c("mpg", "cyl", "wt", "disp", "hp", "drat", "qsec")])
library(psych)
pairs.panels(mtcars[c("mpg", "cyl", "wt", "disp", "hp", "drat", "qsec")])
#we can see only the qsec features are normally distributed. We have some work to do
#In terms of the scatter plot, when the oval is streched, there is a strong correlation
#The red dot is the mean

#In terms of the collinearity, the correlation between weight and cylinder is 0.78,
#wt and disp is 0.89, etc, all of which indicate very strong collnearity

# Train the Model
m <- lm(mpg ~ cyl + wt + disp + hp + drat + qsec + am, data = mtcars)
summary(m)

#backfitting - remove the feature with the highest p value
#cyl removed:
m2 <- lm(mpg ~ wt + disp + hp + drat + qsec + am, data = mtcars)
summary(m2)

#drat removed
m3 <- lm(mpg ~ wt + disp + hp + qsec + am, data = mtcars)
summary(m3)

#disp removed
m4 <- lm(mpg ~ wt + hp + qsec + am, data = mtcars )
summary(m4)

#hp removed
m5 <- lm(mpg ~ wt + qsec + am, data = mtcars )
summary(m5)
#m5 is the final model
mpgPred <- 9.6178 - 3.9165 * mtcars$wt + 1.2259 * mtcars$qsec + 2.9358 * mtcars$am
#predict the model
mpgs <- predict(m5, mtcars[c(6, 7, 9)])
head(mpgs)
#Evaluation
sqerr <- (mtcars$mpg - mpgs)^2
msqerr <- mean(sqerr)
rmse <- sqrt(msqerr)
rmse
#The rmse is used to compare with other model

#Confidence interval for a forecast
#95% CI:mpgPred +- 1.96*SE
#1.96 is the z score for p = 0.95

#if the range for the 95% is large, you can try the 90% interval
#90% CI:mpgPred +- 1.65*SE
#The range is narrower, yet we are less confident

