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