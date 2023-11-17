
#inporting the data 
data = read.csv("D:\\datasets\\heart_data.csv")
View(data)
names(data)


#data preprocessing
data = data[,-1]
names(data)
#"biking"        "smoking"       "heart.disease"
#applying the normalization
library(caTools)
set.seed(123)
split = sample.split(data$smoking,SplitRatio=2/3)
train_data = subset(data , split==TRUE)
test_data = subset(data, split==FALSE)

model = lm(formula = heart.disease ~ biking + smoking,data= train_data)
predictions = predict(model , newdata = test_data)


library(ggplot2)
library(plotly)
ggplotly(ggplot() +
           geom_point(aes(x=train_data$biking,y=train_data$smoking),color = "red") +
           ggtitle("relationship between the biking and smoking") +
           ylab("train data biking") + 
           xlab("train data smoking"))

ggplotly(ggplot() +
           geom_point(aes(x=train_data$heart.disease,y=train_data$smoking),color = "red") +
           ggtitle("relationship between the heart.disease and smoking") +
           ylab("train data heart.disease") + 
           xlab("train data smoking"))

ggplotly(ggplot() +
           geom_point(aes(x=train_data$heart.disease,y=train_data$biking),color = "red") +
           ggtitle("relationship between the heart.disease and biking") +
           ylab("train data heart.disease") + 
           xlab("train data biking"))

ggplotly(ggplot() +
           geom_point(aes(x=test_data$biking,y=test_data$heart.disease),color = "red") +
           geom_line(aes(x= test_data$biking,y=predictions),color="blue") +
           ggtitle("predictions  on the test data") +
           ylab("test data Salary") + 
           xlab("test data train_data$biking"))



