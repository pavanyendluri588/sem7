
#load data 
data = iris
names(data)

summary(data)

#preprocessing the data 
library("caTools")
split =  sample.split(data$Species,SplitRatio = 3/4)
train_data  = subset(data,split == TRUE)
test_data = subset(data,split == FALSE)


#installing the RandomForest package
#nstall.packages("randomForest")

#loading the RandomForest linrary
library(randomForest)
randomforest_model = randomForest(formula = Species ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width,data = train_data, mtry =5,ntree = 100,importance = TRUE)

randomforest_model

plot(randomforest_model)



#prediction 
predicted_data = predict(randomforest_model,test_data,type = "response")

predicted_data

table(test_data[,5])
#confusion matrix 
 aa = table(test_data[,5],predicted_data)
aa


#cross table 
library("gmodels")
CrossTable(test_data[,5],predicted_data,prop.chisq = FALSE)

#
library("caret")
confusionMatrix(aa)
