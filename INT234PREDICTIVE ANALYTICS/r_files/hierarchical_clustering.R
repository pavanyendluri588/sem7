iris1 = iris
names(iris1)
#deleting the species column
iris1$Species = NULL
names(iris1)
distance = dist(iris1,method = "euclidean")
distance
model = hclust(distance,method = "average")
plot(model)
groups = cutree(model,k=3)   #divide the tree into groups 


#ploting the groups
rect.hclust(model,k=3,border = "red")
