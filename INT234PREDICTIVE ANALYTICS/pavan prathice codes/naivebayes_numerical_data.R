
rm(list= ls())
#loading data 
data = read.csv("D:\\datasets\\Naive-Bayes-Classification-Data.csv")
View(data)
sum(is.na(data))

colSums(is.na(data))

set.seed(110)
library("caTools")
split= sample.split(data$glucose,SplitRatio = 3/4)
train_data  = subset(data,split==TRUE)
nrow(train_data)
ncol(train_data)
test_data = subset(data,split==FALSE)
nrow(test_data)
ncol(test_data)


#navie bayes library 
#install.packages('e1071', dependencies=TRUE)
library(e1071)

#loading the data  and training the model
classifier = naiveBayes(train_data[,1:2],train_data[,3])

#predicting the values 
prediction_data = predict(classifier,test_data[,1:2])
prediction_data
#table
aa = table(prediction_data,test_data[,3])
aa
library("gmodels")
CrossTable(aa,prop.chisq = TRUE)


library("caret")
confusionMatrix(aa)
