iris_data = iris
table(iris_data$Species)
#iris_data$Species <- factor(iris_data$Species,labels = c("setosa","versicolor","virginica") , levels  = c("se","ve","vi") )
normalization_min_max_scalar = function(x){
  return (((x-min(x))/max(x)-min(x)))
}
colSums(is.na(iris_data) )
table(iris_data$Species)
#View(iris_data)

iris_data_n=as.data.frame(lapply(iris_data[,1:4], normalization_min_max_scalar ))
nrow(iris_data_n)
iris_train_data = iris_data_n[c(1:40,51:90,101:140),]
iris_test_data = iris_data_n[c(41:50,91:100,141:150),]
iris_train_lables = iris_data[c(1:40,51:90,101:140),5]
iris_test_lables = iris_data[c(41:50,91:100,141:150),5]
library(class)
predicted_data = knn(train = iris_train_data ,test = iris_test_data,cl = iris_train_lables,k = 11 )
library(gmodels)
CrossTable(iris_test_lables,predicted_data,prop.chisq = FALSE)
aa<-table(iris_test_lables,predicted_data)
library(caret)
confusionMatrix(aa)


my_data = data.frame(x1=1:10,x2= letters[1:10])
my_data
my_data_samp <- sample(3, size = 45,replace =TRUE, prob = c(0.33,0.33,0.34))
my_data_samp
table(my_data_samp)

iris_data = iris
dup_indexes <-  sample(2, size =nrow(my_data) ,replace =TRUE,prob = c(0.70,0.30))
nrow(iris_data)
table(iris_data$Species)
#iris_data$Species <- factor(iris_data$Species,labels = c("setosa","versicolor","virginica") , levels  = c("se","ve","vi") )
normalization_min_max_scalar = function(x){
  return (((x-min(x))/max(x)-min(x)))
}
colSums(is.na(iris_data) )
table(iris_data$Species)
#View(iris_data)

iris_data_n=as.data.frame(lapply(iris_data[,1:4], normalization_min_max_scalar ))
nrow(iris_data_n)
iris_train_data = iris_data_n[dup_indexes == 1,1:4]
iris_test_data = iris_data_n[dup_indexes == 2,1:4]
iris_train_lables = iris_data[dup_indexes== 1,5]
iris_test_lables = iris_data[dup_indexes== 2,5]
library(class)
predicted_data  = knn(train = iris_train_data ,test = iris_test_data,cl = iris_train_lables,k = 11 )
predicted_data = predict(knn_model , iris_test_data)
iris_test_lables
library(gmodels)
CrossTable(iris_test_lables,predicted_data,prop.chisq = FALSE)
predicted_data
table(predicted_data)
iris_test_lables

aa<-table(iris_test_lables,predicted_data)
aa
library(caret)
confusionMatrix(aa)

