#install.packages("datarium")
library(datarium)

data = marketing
names(data)

set.seed(123)
split = sample.split(data$youtube , SplitRatio = 2/3)
train_data = subset(data,split == TRUE)
test_data = subset(data,split == FALSE)

regression = lm(formula = sales ~ youtube + facebook + newspaper,data = train_data)
test_predictions = predict(regression , newdata =  test_data)

#ggplotly(ggplot() +
#           geom_point(aes(x=test_data[1],z= test_data[2],y=test_data$sales),color = "red") +
#           geom_line(aes(x=test_data[1],z= test_data[2],y=test_predictions),color="blue") +
#           ggtitle("predictions  on the test data") +
#           ylab("test data  of youtube  facebook  newspaper ") + 
#           xlab("test data sales  "))
       