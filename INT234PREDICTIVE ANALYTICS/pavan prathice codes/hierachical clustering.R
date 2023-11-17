rm(list = ls())
data = iris
data = iris[,-5]

set.seed(1004)
data[,c(1,2)]
data_dist = dist(data[,c(1,2)])
hieracherical_cluster = hclust(data_dist,method = "average")

hieracherical_cluster$height

plot(hieracherical_cluster)


cluster_no_of_labels = cutree(hieracherical_cluster,k=3)
#k = specify the no of cuts of the tree
cut_boders

#to draw the rectangles to the around the branches of the dendrogram

rect.hclust(hieracherical_cluster,k=3,border="red")






