#Sepal.Length" "Sepal.Width"  "Petal.Length" "Petal.Width


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

test_data= subset(data,split==FALSE)


names(data)
main_degree = 12
formula_1 = Sepal.Length ~ poly(Sepal.Width,degree = main_degree) + poly(Petal.Length,degree = main_degree) + poly(Petal.Width,degree = main_degree)

poly_model = lm(formula_1,data = train_data)

predicted_data = predict(poly_model,test_data)

library(ggplot2)
library(plotly)
ggplotly(ggplot() + geom_point(aes(test_data$Sepal.Width,test_data$Sepal.Length),col= "red")+
           geom_line(aes(test_data$Sepal.Width,predicted_data),col="blue")+
           ggtitle("this is the graph between the real and the predicted avlues") + 
           xlab("sepal width")+ 
           ylab("sepal length")
         )
