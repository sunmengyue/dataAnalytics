library(tidyverse)
#Sometimes we want to have different mappings for different geometries and sometimes we do not. 
#If we want to share aesthetics between functions,we can set it in the ggplot() function call instead
ggplot(cars) + geom_point(aes(x = speed, y = dist))
cars %>% ggplot(aes(x = speed, y = dist)) + geom_point()

#When you specify the color as an aesthetic, you let it depend on another variable in the data.
iris %>% qplot(Petal.Width, Petal.Length, color = Species, data = .)
iris %>% ggplot() + geom_point(aes(x = Petal.Width, y = Petal.Length, color = Species))

#If you want to hard write color or any other graphics parameter, you just need to move the 
#parameter assignment outside the aes() call
iris %>% ggplot + geom_point(aes(x = Petal.Width, y = Petal.Length), color = "red")

#qplot plot histogram and a density plot. The histogram below can be constructed using 
#geom_histogram() and geom_density() respectively
cars %>% qplot(speed, data = ., bins = 10)
cars %>% qplot(speed, data = ., geom = "density")

cars %>% ggplot + geom_histogram(aes(x = speed), bins = 10)
cars %>% ggplot + geom_density(aes(x = speed))
#a combinition of the two methods above
#By setting y = ..count.., you tell both geometries to use counts as the y-axis
#To get densities instead, you can use y = ..density...
cars %>% ggplot(aes(x = speed, y = ..count..)) + geom_histogram(bins = 10) + geom_density()

#compare the two methods below
cars %>% ggplot(aes(x = speed, y = dist)) + 
         geom_point() + geom_smooth(method = "lm")
cars %>% ggplot(aes(x = speed, y = dist)) + 
  geom_point() + geom_smooth()

#Use more than one geometric
longley %>% ggplot(aes(x = Year)) +
  geom_line(aes(y = Unemployed)) + 
  geom_line(aes(y = Armed.Forces), color = "blue")

longley %>% ggplot(aes(x = Year)) +
  geom_point(aes(y = Unemployed)) + 
  geom_point(aes(y = Armed.Forces), color = "blue") +
  geom_line(aes(y = Unemployed)) + 
  geom_line(aes(y = Armed.Forces), color = "blue")

longley %>% gather(key, value, Unemployed, Armed.Forces) %>%
  ggplot(aes(x = Year, y = value, color = key)) + geom_line() +
  facet_grid(key ~ .)
