data = iris

names(data)
#total null values in teh data 
sum(is.na(data))

#total null values column wise 
colSums(is.na(data))

#spliting the data 
set.seed(123)
split =  sample.split(data$Sepal.Length,SplitRatio = 3/4)
train_data = subset(data,split==TRUE)
test_data = subset(data,split==FALSE)

library(rpart)
#forula for the decision tree 
formula = Species ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width     
decision_tree_using_rpart = rpart(formula = formula,data= train_data)


#predicting the data  probabilites 
predicted_data = predict(decision_tree_using_rpart,test_data,type = "class")

#calculating the crosstable 

aa = table(test_data$Species,predicted_data)
aa

#calculating the cross table using th gmodels
CrossTable(aa)

#calculating the confunsion matrix 
library(caret)
confusionMatrix(aa)
