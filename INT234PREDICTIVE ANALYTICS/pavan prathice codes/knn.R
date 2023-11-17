library(ggplot2)
data = as.data.frame(diamonds)
str(data)

summary(data)
unique(data$color)
View(data)
#preprocessing 
library(caTools)
split = sample.split(data$color,SplitRatio = 3/4)
train_data = subset(data,split == TRUE)

sqrt(nrow(train_data))
test_data = subset(data,split == FALSE)

names(data)


formula = clarity ~ carat + cut + color  + depth + table + price + x + y + z

#importing the odel 
library(rpart)
model = rpart(formula =  formula,data = train_data)


predictions = predict(model,newdata = test_data,type = "class")

library(caret)
confusionMatrix(table(test_data$clarity,predictions))


library(party)

ctree_model = ctree(formula = formula,data = data,)
cctree_predictions = predict(ctree_model,test_data,type="response")
cctree_predictions


library(caret)
confusionMatrix(table(test_data$clarity,cctree_predictions))

train_data[-4]
nrow(train_data[,-4])
nrow(train_data[,4])
#trying knn 

data= diamonds
unique(data$cut)

data$cut = factor(data$cut,levels = c("Ideal","Premium","Good","Very Good","Fair"),labels=c(1,2,3,4,5))
data$cut
unique(data$color)
data$color = factor(data$color,levels = c("D","E","F","G","H","I","J"),labels=c(1,2,3,4,5,6,7))
data$color
data$clarity = as.factor(data$clarity)
data
data = diamonds
data1 = data[,4:10]
data1
sum(is.na(data1))
split = sample.split (data1$color,SplitRatio = 3/4)
unique(split)
train_data_without_labels = subset(data1[,-1],split=TRUE)
train_data_without_labels
nrow(train_data_without_labels)
ncol(train_data_without_labels)

train_data_labels = subset(data1[,1],split==TRUE)
train_data_labels
nrow(train_data_labels)
ncol(train_data_labels)

test_data_without_labels = subset(data1[,-1],split==FALSE)
test_data_without_labels
nrow(test_data_without_labels)
ncol(test_data_without_labels)

test_data_labels = subset(data1[,1],split==FALSE)
test_data_labels
nrow(test_data_labels)
ncol(test_data_labels)

library(class)
predicted_data  = knn(train_data_without_labels,
                      test_data_without_labels,
                      cl=train_data_labels,
                      k = 201)

library(caret)
confusionMatrix(predict(test_data_labels,predicted_data))

