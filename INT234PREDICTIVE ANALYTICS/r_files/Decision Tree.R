library(rpart)

data = read.csv("C:\\Users\\Pavan\\Downloads\\Cardiotocographic.csv")
View(data)
str(data)
size = nrow(data)

indexes = sample(size, size*0.7)

train = data[indexes, ]
test = data[-indexes, ]

target = NSP ~ LB + AC + FM

tree = rpart(target, data = train, method = "class")

library(rpart.plot)

rpart.plot(tree)

predicted_values = predict(tree, test)
predicted_values

length(predicted_values)

table1 = table(predicted_values, test$NSP)


