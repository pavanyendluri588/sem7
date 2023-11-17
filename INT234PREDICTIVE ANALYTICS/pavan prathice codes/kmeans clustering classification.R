#lloading the required library
library("cluster")
#loading the data
data = iris
data

#data preprocessing 
names(data)
colSums(is.na(data))
sum(is.na(data))

#removing the species column
data = data[,-5]
names(data)

#applyins the k emans clustering 

kmeanss_classification = kmeans(data,centers = 3,nstart = 30)
#centers tell the no of centeriods in the cluster ,centers=k_value

#nstart tell no of itereations with changing the initiak position of the andrios 

kmeanss_classification$cluster

iris_labels = factor(iris[,5],labels = c(1,2,3),levels = c("setosa","versicolor","virginica"))
iris_labels 

actual_prectcted_cross_table=table(iris_labels,kmeanss_classification$cluster)
actual_prectcted_cross_table

#cross table 
library(gmodels)
CrossTable(actual_prectcted_cross_table)


#cconfusion matrix 
library("caret")
confusionMatrix(actual_prectcted_cross_table)


#ploting the resulltes 
plot(data[,c(1,2)],col= iris_labels, main= "this is the clustering of the iris dataset")
#ploting the centers 
points(kmeanss_classification$centers[,c(1,2)],col=1:3)
