data = read.csv("D:\\datasets\\drug200.csv")
str(data)
summary(data)
data$Sex = as.factor(data$Sex)
data$BP = as.factor(data$BP)
data$Cholesterol = as.factor(data$Cholesterol)
data$Drug = as.factor(data$Drug)

#data preprocessing 
sum(is.na(data))

library(caTools)
split = sample.split(data$Age,SplitRatio = 3/4)
train_data = subset(data,split == TRUE)
test_data = subset(data,split == FALSE)

#immplementing the decision tree using the rpart 
library(rpart)
names(data)
formula = Drug ~ Age + Sex + BP + Cholesterol + Na_to_K
decision_tree = rpart(formula = formula,data = train_data)
plot(decision_tree)

predicted_data = predict(decision_tree,test_data,type = "class")

library(caret)
confusionMatrix(table(test_data$Drug,predicted_data))



#decision tree using ctree
library(party)

decision_tree_ctree = ctree(formula = formula,data = train_data)
plot(decision_tree_ctree)

predicted_data_ctree = predict(decision_tree_ctree,test_data,type = "response")

library(caret)
confusionMatrix(table(test_data$Drug,predicted_data_ctree))

