
cars<-read.csv('Car_data.csv') 
##Generate a random number that is 70% of the total number of rows in dataset.
ran <- sample(1:nrow(cars), 0.7 * nrow(cars)) 

##the normalization function is created
nor <-function(x) { (x -min(x))/(max(x)-min(x))   }

##Run nomalization on first 4 coulumns of dataset because they are the predictors
cars_norm <- as.data.frame(lapply(cars[,c(1,2,3,4)], nor))

summary(cars_norm)
##extract training set
cars_train <- cars_norm[ran,] 
##extract testing set
cars_test <- cars_norm[-ran,] 
##extract 5th column of train dataset because it will be used as 'cl' argument in knn function.
cars_target_category <- cars[ran,5]
##extract 5th column if test dataset to measure the accuracy
cars_test_category <- cars[-ran,5]
##load the package class
library(class)
##run knn function
pr <- knn(cars_train,cars_test,cl=cars_target_category,k=13)

##create confusion matrix
tab <- table(pr,cars_test_category)

##this function divides the correct predictions by total number of predictions that tell us how accurate teh model is.

accuracy <- function(x){sum(diag(x)/(sum(rowSums(x)))) * 100}
accuracy(tab)
