
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
train_data = subset(data,split==TRUE)
nrow(train_data)

test_data = subset(data,split==FALSE)
ncol(test_data)

#model creation
library(e1071)
formula = Species ~ Sepal.Length +  Sepal.Width + Petal.Length + Petal.Width
naive_bayes_model = naiveBayes(formula = formula,data = data)



predicted_data = predict(naive_bayes_model,test_data)

#confusion matrix 
library(caret)
confusionMatrix(table(test_data$Species,predicted_data))


library(ggplot2)
library(plotly)
unique(data$Species)
ggplotly(ggplot(test_data,aes(Sepal.Length,Sepal.Width,color=Species)) + geom_point()+
           ggtitle("this graph represents the relation between the sepal length and sepal width")+
           xlab("sepal length")+
           ylab("sepal width")
           )




