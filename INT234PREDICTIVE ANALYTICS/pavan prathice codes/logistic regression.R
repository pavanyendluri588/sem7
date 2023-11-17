#removing the all the precvious data
rm(list = ls())
#loading the data 
data = read.csv("D:\\datasets\\Social_Network_Ads_logistic_regression.csv")
#View(data)
head(data)
data$User.ID = NULL
names(data)


#creating the  normmalize function 
normalize = function(x){
  return((x-max(x))/(max(x)-min(x)))
}
#ploting the age vs salary  before normaliing
library(ggplot2)
data$Age_nom = normalize(data$Age)
data$EstimatedSalary_nom = normalize(data$EstimatedSalary)
ggplot() + geom_line(aes(x= data$Age,data$EstimatedSalary),color = "red")


#ploting the data after normalizing
ggplot() +   geom_line(aes(x= data$Age_nom,y=data$EstimatedSalary_nom),color="blue")


data$Gender = factor(data$Gender,levels = c("Male","Female"),labels = c(1,0)) 
head(data)


#splitting the data into train and test 
set.seed(100)
library(caTools)
split  = sample.split(data$Gender , SplitRatio = 3/4)
train_data = subset(data,split == TRUE)
test_data = subset(data, split == FALSE)
nrow(test_data)
#generalised linear model 
names(data)
formula =  Purchased ~ Gender + Age + EstimatedSalary
formula1 = Purchased ~ Gender + Age_nom + EstimatedSalary_nom
logistic_regression_classifier = glm(formula = formula1, data = train_data, family = "binomial")



#predicting the data 
predicted_data = predict(logistic_regression_classifier,newdata = test_data,type="response")
predicted_data
length(predicted_data)

 logistic_reg_value = function(x){
   if(x>=0.5){
     return(1)
   }else {
     return(0)
   }
 }
 
 predicted_data_func = sapply(predicted_data ,logistic_reg_value )
 predicted_data_func
 aa = table(predicted_data_func,test_data$Purchased)

 
 #gmodels
 library(gmodels)
CrossTable(aa)


#calculating the accuracy
library(caret)
confusionMatrix(aa)

