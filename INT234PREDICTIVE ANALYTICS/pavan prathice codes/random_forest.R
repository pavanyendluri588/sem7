
data = iris

#total null values 
sum(is.na(data))
#total null values column wise 
colSums(is.na(data))
#internal structue 
str(data)

#column names of the data 
colnames(data)

#summery about the data 
summary(data)

#preprocessing
library("caTools")

split = sample.split(data$Sepal.Width,SplitRatio = 3/4)
train_data_without_labels = subset(data[,1:4],split==TRUE)
nrow(train_data_without_labels)
train_data_labels = subset(data[,5],split==TRUE)
nrow(train_data_without_labels)


test_data_without_labels = subset(data[,1:4],split==FALSE)
test_data_labels = subset(data[,5],split==FALSE)
nrow(test_data_without_labels)

#model creation 
library(randomForest)
randomforest_model = randomForest(x= train_data_without_labels,
             y= train_data_labels,
             ntree = 500)
plot(randomforest_model)

predicted_data = predict(randomforest_model,test_data_without_labels)
predicted_data


#confusion matrix
library(caret)
confusionMatrix(table(test_data_labels,predicted_data))
