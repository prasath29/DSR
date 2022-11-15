credit <- read.csv("E:\\Academic Docs\\Semester-5\\Data Science using R\\credit.csv")
str(credit)
tb <- table(credit$savings_balance)
summary(credit$amount)
credit$default <- factor(credit$default)
set.seed(123)
train_sample <- sample(1000, 900)
str(train_sample)
x_train <- credit[train_sample, -17]
x_test <- credit[-train_sample, -17]
y_train <- credit[train_sample, 17]
y_test <- credit[-train_sample, 17]
library(C50)
model <- C5.0(x_train,y_train)
summary(model)
y_pred <- predict(model,x_test)
cm <- table(y_pred,y_test)
print(cm)
acc<-sum(diag(cm))/sum(cm)
print(paste("Accuaracy: ",acc*100,"%"))