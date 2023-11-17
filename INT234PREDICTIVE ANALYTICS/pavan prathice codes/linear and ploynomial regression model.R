data = read.csv("D:\\datasets\\manufacturing_poly.csv")
#View(data)
names(data)
is.na(data)
#total null values in the data 
sum(is.na(data))
sum(is.na(data),na.rm = FALSE)

nrow(data)
#renaming the columns
data$Temperatureinc = data$Temperature...C.
data$Temperature...C. = NULL

data$PressureinkPa = data$Pressure..kPa.
data$Pressure..kPa. =NULL

data$TemperaturexPressure = data$Temperature.x.Pressure
data$Temperature.x.Pressure = NULL

data$MaterialFusionMetric = data$Material.Fusion.Metric
data$Material.Fusion.Metric = NULL

data$MaterialTransformationMetric = data$Material.Transformation.Metric
data$Material.Transformation.Metric = NULL

data$QualityRating = data$Quality.Rating
data$Quality.Rating = NULL

#to find the column wise no of null avlues we sue the colSums sum column wise 

colSums(is.na(data))

library(caTools)
split = sample.split(data$Temperatureinc,SplitRatio = 3/4)
split
length(split) 


train_data = subset(data,split==TRUE)
nrow(train_data)
ncol(train_data)


test_data = subset(data,split==FALSE)
nrow(test_data)
ncol(test_data)



#building the linear regression model 
#lm() #linear model this is buildin function 
# dependent variable ~ independent variables 
linear_regression_model = lm(formula = QualityRating ~ Temperatureinc + PressureinkPa + TemperaturexPressure + MaterialFusionMetric + MaterialTransformationMetric,
                             data = train_data)

#prediction on the test data 
linear_model_predictions = predict(linear_regression_model,test_data)

#visuallising the data 
library(ggplot2)
ggplot() +  geom_point(aes(x= test_data$Temperatureinc,y = test_data$QualityRating),
                      color = "red") + 
  geom_line(aes(x= test_data$Temperatureinc,y=linear_model_predictions ),color="blue")  + 
  ggtitle("linear_regression_model the graph netween the Temperatureinc and QualityRating") + 
  xlab("Temperatureinc data") + 
  ylab("QualityRating data ")


#polynomial regression model
data1 = poly(data$Temperatureinc , degree = 3, raw = TRUE)
data1
names(data1)

degree_value = 5
polunomial__refression_model = lm(formula = QualityRating ~ poly(Temperatureinc,degree = degree_value,raw = TRUE)
                             + poly(PressureinkPa,degree = degree_value,raw = TRUE) +
                               poly(TemperaturexPressure,degree = degree_value,raw = TRUE) +
                               poly(MaterialFusionMetric,degree = degree_value,raw = TRUE) + 
                               poly(MaterialTransformationMetric,degree = degree_value,raw = TRUE) + 
                               poly(Temperatureinc,degree = degree_value,raw = TRUE),
                             data = train_data)


#prediction on the test data 
polynomial_regression_predictions_test_data = predict(polunomial__refression_model,test_data)



#rmse 
m1 = mean((test_data$QualityRating - polynomial_regression_predictions_test_data)^2)

sqrt(m1)
#visuallising the data 
library(ggplot2)
ggplot() +  geom_point(aes(x= test_data$Temperatureinc,y = test_data$QualityRating),
                       color = "red") + 
  geom_line(aes(x= test_data$Temperatureinc,y=polynomial_regression_predictions_test_data ),color="blue")  + 
  ggtitle(" test datapolynomial_regression_predictions the graph netween the Temperatureinc and QualityRating") + 
  xlab("Temperatureinc data") +
  ylab("QualityRating data")

polynomial_regression_predictions_train_data = predict(polunomial__refression_model,train_data)
ggplot() +  geom_point(aes(x= train_data$Temperatureinc,y = train_data$QualityRating),
                       color = "red") + 
  geom_line(aes(x= train_data$Temperatureinc,y=polynomial_regression_predictions_train_data ),color="blue")  + 
  ggtitle(" train_data polynomial_regression_predictions the graph netween the Temperatureinc and QualityRating") + 
  xlab("Temperatureinc data") +
  ylab("QualityRating data")


  
#calculating the accuracy 
#RMSE is  in the metrics package
#install.packages("Metrics")
library(semEff)
library(ModelMetrics)
rmse(test_data$QualityRating,polynomial_regression_predictions_test_data)
r2(test_data$QualityRating,polynomial_regression_predictions_test_data)
names(summary(polunomial__refression_model))
summary(polunomial__refression_model)$r.squared

