SalesData <- read.csv("D:\\sem7\\INT234PREDICTIVE ANALYTICS\\datasets\\SalesDatafor preprocessingcleaning dataset example.csv")
head(SalesData)
names(SalesData)
colSums(is.na(SalesData))
str(SalesData)






sales <- read.csv("D:\\sem7\\INT234PREDICTIVE ANALYTICS\\datasets\\SalesDatafor preprocessingcleaning dataset example.csv")
str(sales)

is.na(sales)
sum(is.na(sales))
colSums(is.na(sales))
complete.cases(sales)
DeleteNullSales <- sales[complete.cases(sales), ]
colSums(is.na(DeleteNullSales))

# or na.omit(sales)

ReplaceMeanSales <- sales
ReplaceMeanSales$Sales[is.na(ReplaceMeanSales$Sales)] <- mean(ReplaceMeanSales$Sales, na.rm = TRUE)
ReplaceMeanSales$Profit[is.na(ReplaceMeanSales$Profit)] <- mean(ReplaceMeanSales$Profit, na.rm = TRUE)
ReplaceMeanSales$Unit.Price[is.na(ReplaceMeanSales$Unit.Price)] <- mean(ReplaceMeanSales$Unit.Price, na.rm = TRUE)
colSums(is.na(ReplaceMeanSales))
