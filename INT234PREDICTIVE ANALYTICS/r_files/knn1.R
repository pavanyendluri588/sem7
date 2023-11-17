data = read.csv("D:\\sem7\\INT234PREDICTIVE ANALYTICS\\datasets\\wisc_bc_data.csv")
head(data)
data_1 <- data[-1]
head(data_1)
colnames(data_1)
data_1$diagnosis<- factor(data_1$diagnosis, levels = c("B", "M"),
                         labels = c("Benign", "Malignant"))
factor(data_1$diagnosis,lebels=c(""))
normalization_min_max_scalar = function(x){
  return ((x-min(x))/(max(x)-min(x)))
}
"""
k_value_fun= function(x){
  if (round(sqrt(nrow(x)),0)%2 ==0) {
    return ( round(sqrt(nrow(x)),0)-1)
    
  }else{
    return (round(sqrt(nrow(x)),0))
  }
}





k_value = k_value_fun(data_1_n)
k_value
"""
data_1_n = as.data.frame(lapply(data_1[2:31],normalization_min_max_scalar))
head(data_1_n)
nrow(data_1_n)
train_data=data_1_n[1:469,]
head(train_data)
test_data = data_1_n[470:569,]
train_lables= data_1[1:469,1]
test_lables = data_1[470:569,1]
nrow(train_data)
nrow(train_lables)
#install.packages("class")
library("class")

predicted_values = knn(train = train_data ,test =  test_data, cl = train_lables , k = 21  )
nrow(test_lables)
#install.packages("gmodels")
library(gmodels)
CrossTable(x= test_lables,y= predicted_values , prop.chisq = FALSE )
aa<-table(test_lables,predicted_values)
#install.packages("caret")
library(caret)
confusionMatrix(aa)
