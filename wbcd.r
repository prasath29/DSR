bcd<-read.csv("E:\\ Academic Docs\\Semester-5\\Data Science using R\\winequality.csv")
str(wine)
hist(wine$quality)
print(6497*0.7)
wine_train <- wine[1:4548, ]
wine_test <- wine[4549:6497, ]
install.packages("rpart")
library(rpart)