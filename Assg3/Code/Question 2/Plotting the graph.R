setwd("C:\\Users\\anjali\\Desktop\\Machine Learning 5780\\Assingment 3")


library(ggplot2)

a<- read.csv("Solution 1c.csv", header=FALSE);


qplot(a[,1], a[,2], geom = c("point", "line"),xlab="log(C,2)", ylab="Validation Accuracy",
      main = "Average Accuracies for 5-Folds");
qplot(a[,1], a[,3], geom = c("point", "line"),xlab="log(C,2)", ylab="Test Accuracy",
      main = "Average Accuracies for 5-Folds");


