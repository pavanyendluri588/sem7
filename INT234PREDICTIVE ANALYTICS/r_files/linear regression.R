data = read.csv("D:\\datasets\\Salary_Data.csv")
#View(data)

library(caTools)
set.seed(123)
split = sample.split(data$Salary,SplitRatio=2/3)
train_data = subset(data , split==TRUE)
test_data = subset(data, split==FALSE)
#View(train_data)
#View(test_data)



regression = lm(formula = Salary ~ YearsExperience,data = train_data)
#predictions = predict(regression , newdata = data.frame(test_data$YearsExperience))
predictions = predict(regression , newdata = test_data)


library(ggplot2) 
library(plotly)#creating the intercative graphs 
train_predictions = predict(regression , newdata = data.frame(train_data))
ggplotly(ggplot() +
  geom_point(aes(x=train_data$YearsExperience,y=train_data$Salary),color = "red") +
  geom_line(aes(x= train_data$YearsExperience,y=train_predictions),color="blue") +
  ggtitle("predictions  on the train data") +
  ylab("train data Salary") + 
  xlab("train data YearsExperience"))


 
 
ggplotly(ggplot() +
  geom_point(aes(x=test_data$YearsExperience,y=test_data$Salary),color = "red") +
  geom_line(aes(x= test_data$YearsExperience,y=predictions),color="blue") +
  ggtitle("predictions  on the test data") +
  ylab("test data Salary") + 
  xlab("test data YearsExperience"))

  
  