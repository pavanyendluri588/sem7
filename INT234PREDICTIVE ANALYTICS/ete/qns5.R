data = read.csv("D:\\datasets\\heart.csv")
View(data)

nrow(data)
ncol(data)

#total null values 
sum(is.na(data))

#total null values column wise 
colSums(is.na(data))

#internal structue 
str(data)

#head
head(data)


#column names of the data 
colnames(data)

#summery about the data 
summary(data)

data$target = factor(data$target,levels = c(0,1),labels = c("0","1"))
data$target
#preprocessing
library("caTools")

set.seed(1234)
split = sample.split(data$age ,SplitRatio = 3/4)
train_data_without_labels = subset(data[,1:13],split==TRUE)
nrow(train_data_without_labels)
train_data_labels = subset(data[,14],split==TRUE)
nrow(train_data_without_labels)



test_data_without_labels = subset(data[,1:13],split==FALSE)
test_data_labels = subset(data[,14],split==FALSE)
nrow(test_data_without_labels)


#model creation  random forest
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



#decision tree using the  party(ctree)
train_data = subset(data,split==TRUE)
nrow(train_data)

test_data = subset(data,split==FALSE)
ncol(test_data)


library(party)
ctree_model <-ctree(target ~ . ,data = train_data) 
plot(ctree_model)

#predicting the data 
predicted_data = predict(ctree_model,test_data)

predicted_data

#cross table
library(gmodels)
CrossTable(table(test_data$target,predicted_data))

#confusion matrix
library(caret)
confusionMatrix(table(test_data$target,predicted_data))




