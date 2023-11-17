library(e1071)
data = iris
set.seed(123)
library(caTools)
split = sample.split(data$Sepal.Length,SplitRatio = 3/4 )
train_data = subset(data,split==TRUE)
test_data = subset(data,split == FALSE)

names(data)
formula = Species ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width
svm_model = svm(x = train_data[,1:4], y = train_data[,5], type = 'C-classification', 
    kernel = 'linear')

predicted_data = predict(svm_model,newdata = test_data[,1:4])
aa = table(test_data[,5],predicted_data)
aa

library(caret)
confusionMatrix(aa)
    
