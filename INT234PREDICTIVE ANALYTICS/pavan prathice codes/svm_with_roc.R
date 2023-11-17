data =  read.csv("D:\\datasets\\social.csv")
sum(is.na(data))
names(data)

View(data)
data$Gender= factor(data$Gender,levels=c("Female","Male"),labels=c(1,2))

#applying the mormalization
data = data[,3:5]
norm = function(x){
  return((x-min(x))/(max(x)-min(x)))
}
data$Age =  as.data.frame(lapply(data$Age, norm))
data$EstimatedSalary =as.data.frame(lapply(data$EstimatedSalary,norm))
#spliting the data 
library(caTools)
split  = sample.split(data$Age,SplitRatio = 3/4)
train_data = subset(data,split == TRUE)
test_data = subset(data,split == FALSE)
formula = Purchased ~  Age + EstimatedSalary
library(e1071)
svm_model = svm(formula = formula,data= train_data,type = 'C-classification', 
                kernel = 'linear')
library(caret)
predicted_data = predict(svm_model,test_data)
predicted_data
confusionMatrix(table(test_data$Purchased,predicted_data))

#Receiver operating characteristic
library(ROCR)
#calucalating the prediction object 
pred = prediction(predictions = predicted_data , labels = test_data$Purchased )

#calculating the roc curve 
perf <- performance(pred, measure = "tpr", x.measure = "fpr")

# Plot the ROC curve
plot(perf, main = "ROC Curve for SVM Model", xlab = "False Positive Rate", ylab = "True Positive Rate")

# Calculate the AUC
auc <- performance(pred, "auc")

auc
