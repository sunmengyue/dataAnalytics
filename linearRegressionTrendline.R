data("LakeHuron")
head(LakeHuron)
year <- 1875 : 1972
level <- LakeHuron
df <- data.frame(year, level)
head(df)
tail(df)

#Linear Regression TrendLine
library(ggplot2)
ggplot(df, aes(year, level)) + geom_line()
model <- lm(df$level ~ df$year)
summary(model)
print(model)
# F.level =  625.5549  +  (-0.0242) * year
# F(1973) =  625.5549  +  (-0.0242) * 1973
F.t <- 625.5549  +  (-0.0242) * 1973
F.t

#MAD (Mean Absolute Deviation) calculation in R
df$F <- 0
df$absErr <- 0
for (i in 1:nrow(df)) {
  df$F[i] <- -0.024 * df$year[i] + 625.5549
  df$absErr[i] <- abs(df[i, 2] - df$F[i])
}
head(df)
mean(df$absErr)
# Mad(trendline) is 0.91