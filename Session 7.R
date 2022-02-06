setwd("D:/Data Science Course/Online Courses/R Programming/Data Set")

customer_churn <- read.csv("customer_churn.csv", stringsAsFactors = T)
library(dplyr)
mat1<-matrix(c(1,2,3,4),nrow=2, byrow= T)

mat1

apply(mat1,1,sum)
apply(mat1,2,sum)

#Margin = 1 indicates rows; 2 indicates columns ; c(1,2) indicates both rows and columns

#matrix m
m <- matrix(c(1:10,11:20,31:40),nrow = 10, ncol = 3)
m
#apply a function column wise
apply(m, 2 , function(x) length(x) - 1)

#number of missing values in a data frame

apply(customer_churn, 2 , function(x) sum(is.na(x)))
colSums(is.na(customer_churn))

apply(customer_churn, 2 , function(x) length(unique(x)))

apply(customer_churn[,c(1:10)],2, function(x) length(unique(x)))

#----------------------------------------------------

my_list <- list(a=c(1,2,3),b=c(2,3,4),c=c(3,4,5))  
lapply(my_list, mean)

#sapply() will try to simplify the output of lapply() if possible
sapply(my_list, mean, simplify = T)

#class of all columns
sapply(customer_churn,class)

tapply(customer_churn$tenure, customer_churn$Partner, mean)
tapply(customer_churn$MonthlyCharges, customer_churn$Churn, mean)

#-------------------------------

#multivariate apply
x<-c(1:5) 
b<-c(6:10)

mapply(sum, x, b)

#........................................

install.packages("ggplot2")
library(ggplot2)

#base
plot(customer_churn$Dependents)
plot(customer_churn$Dependents, col="coral")
plot(customer_churn$Dependents, col="coral",xlab="Dependents",ylab="Frequency",main="Dependents Plot")

#.....................................

dat <- data.frame(table(customer_churn$Dependents))

#a range of y's that'll leave sufficient space above the tallest bar
ylim <- c(0, 1.1*max(dat$Freq))
xx <- barplot(dat$Freq, ylim=ylim,col="steelblue4",
              xlab = "Dependents",
              main = "Distribution of Dependents", 
              ylab = "Frequency")
## Add text at top of bars
text(x = xx, y = dat$Freq, label = dat$Freq,pos=3,cex = 0.8)
axis(side = 1, at=xx, labels=dat$Var1,tick=FALSE)

#------
plot(customer_churn$PhoneService)  
plot(customer_churn$PhoneService,col="aquamarine4")
plot(customer_churn$PhoneService,col="aquamarine4",
     xlab="Phone Service",
     ylab="Frequency",
     main="Distribution of PhoneService")

#--------

plot(customer_churn$Contract)  
plot(customer_churn$Contract,col="palegreen4",xlab="Contract",ylab = "Frequency",main="Distribution of Contract")

#------------------Histogram............

hist(customer_churn$tenure)  
hist(customer_churn$tenure,col="steelblue4",border="white",xlab="Tenure",main="Distribution of Tenure",xlim = c(0,80), breaks=10)
hist(customer_churn$tenure,col="olivedrab", breaks=10)

#..................Scatter Plot........

plot(x = customer_churn$tenure,y= customer_churn$TotalCharges, type="p",pch=20 ,
     xlab = "Tenure", ylab ="Total Charges", main = " Scatter Plot")

# x and y: the coordinates of points to plot
# type : the type of graph to create
# type="p": for points (by default)
# type="l": for lines
# type="b": for both; points are connected by a line
# pch : plotting 'character', i.e., symbol to use


