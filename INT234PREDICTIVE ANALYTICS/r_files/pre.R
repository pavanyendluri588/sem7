data=read.csv("C:\\Users\\Pavan\\Downloads\\data.csv")
(data)
names(data)=c("country","Age","Salary","Purchased")
colnames(data)
is.na(data)
sum(is.na(data))
View(data)
colnames(is.na(data))
data[1,]
complete.cases(data)       
missing_data=data[complete.cases(data),]
data$Age <- ifelse(is.na(data$Age),
                  ave(data$Age, FUN = function(x) mean(x,na.rm=TRUE)),
                  data$Age)
data$Salary <- ifelse(is.na(data$Salary),ave(data$Salary,FUN =function(x) mean(x,na.rm=TRUE)),
                     data$Salary)
data
sum(is.na(data))
str(data)

data$country = factor(data$country,levels = c("France","Spain","Germany"),labels=c(1,2,3))
data$country
data$Purchased = factor(data$Purchased,levels = c("Yes","No"),labels=c(1,0))
data$Purchased
(data)
(data$country)
str(data)
