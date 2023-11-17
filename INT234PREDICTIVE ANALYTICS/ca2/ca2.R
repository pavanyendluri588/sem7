
#inporting the data 
data = read.csv("D:\\datasets\\Prostate_cancer.csv")
#View(data)
names(data)

#data preprocessing 
#removing the unwantesd features 
data = data[,-c(1,11)]
data$diagnosis_result <-factor(data$diagnosis_result,labels =c(1,2) ,levels =c("M","B"))
names(data)
data

#spliting the data for the training and testing 
indexes = sample(100,80)
indexes
train_data = data[indexes,]
train_data
test_data = data[-indexes,]

#View(data)

formula = diagnosis_result ~ radius + texture + perimeter + compactness + symmetry + area + smoothness + fractal_dimension
formula
#install.packages("party")
library(party)
binary_tree = ctree(formula, data = train_data,controls = ctree_control(mincriterion = 0.80))
plot(binary_tree)

#library()
table <- table(predict(tree), train_data$diagnosis_result)


predictions_on_test_data <-predict(binary_tree,test_data)

#creating confusion matrix on the test data
table <- table(predictions_on_test_data, test_data$diagnosis_result)
table
1-sum(diag(table)/sum(table))
