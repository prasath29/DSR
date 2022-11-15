teens <- read.csv("E:\\Academic Docs\\Semester-5\\Data Science using R\\Datasets\\snsdata.csv")
str(teens)
table(teens$gender)
table(teens$gender, useNA = "ifany")
summary(teens$age)
teens$age <- ifelse(teens$age >= 13 & teens$age < 20, teens$age, NA)
summary(teens$age)
teens$female <- ifelse(teens$gender == "F" & !is.na(teens$gender),1,0)
teens$no_gender <- ifelse(is.na(teens$gender), 1, 0)
table(teens$gender, useNA = "ifany")
table(teens$female, useNA = "ifany")
table(teens$no_gender, useNA = "ifany")
mean(teens$age, na.rm = TRUE)
aggregate(data = teens, age ~ gradyear, mean, na.rm = TRUE)
ave_age <- ave(teens$age, teens$gradyear,
                         FUN = function(x) mean(x, na.rm = TRUE))
teens$age <- ifelse(is.na(teens$age), ave_age, teens$age)
summary(teens$age)
interests <- teens[5:40]
interests_z <- as.data.frame(lapply(interests, scale))
set.seed(2345)
teen_clusters <- kmeans(interests_z, 5)
teen_clusters$size
teen_clusters$centers
teens$clusters <- teen_clusters$cluster
teens[1:5, c("clusters", "gender", "age", "friends")]
aggregate(data = teens, age ~ clusters, mean)
aggregate(data = teens, female ~ clusters, mean)
aggregate(data = teens, friends ~ clusters, mean)