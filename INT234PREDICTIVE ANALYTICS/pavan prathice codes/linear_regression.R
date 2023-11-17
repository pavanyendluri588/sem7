#data = read.csv("")



data = data.frame(val = c(1,2,3,4,5,6,7,8,9))

poly_values = poly(data$val,degree =  2)
poly_values

?poly()
poly_values1 = poly(data$val,degree =  10,raw = TRUE)
poly_values1

