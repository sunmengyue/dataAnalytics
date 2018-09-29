data("LakeHuron")
head(LakeHuron)
year <- 1875 : 1972
df <- data.frame(year, LakeHuron)

#Moving Average
#4-year Moving Average
n <- nrow(df)
tail(df)
last4 <- df[n : (n - 3), 2] 
mean(last4)

#Weighted Moving Average
#Must define weights
#Choose 3, 2, 1, 1
last4
w <- c(3, 2, 1, 1)
tail(df)
sw <- w * last4
F <- sum(sw)/sum(w)

#Exponential Smoothing
#alpha = 0.3
df$Ft = 0
df$E = 0
head(df)
df$Ft[1] <- df[1, 2]
head(df)
#Ft = F(t - 1) + a * E(t - 1)
df$Ft[2] <- df$Ft[1] + 0.3 * df$E[1] 
head(df)
df$E[2] <- df[2, 2] - df$Ft[2]
head(df)
for (i in 2:nrow(df)) {
  df$Ft[i] <- df$Ft[i - 1] + 0.3 * df$E[i - 1]
  df$E[i] <- df[i, 2] - df$Ft[i]
}
head(df)
tail(df)
n <- nrow(df)
Forcast <- df$Ft[n] + 0.3 * df$E[n]
Forcast

mean(df$E)

