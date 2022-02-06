setwd("D:/Data Science Course/Online Courses/R Programming/Data Set")

customer_churn <- read.csv("customer_churn.csv", stringsAsFactors = T)
library(ggplot2)
library(dplyr) 
library(splitstackshape)
library(corrplot)

#mean

mean(customer_churn$MonthlyCharges)
mean(customer_churn$TotalCharges,na.rm = T)

#median
median(customer_churn$MonthlyCharges)

# Mode

#method1

gmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v,uniqv)))]
}


#method2

# names function on the table returns the names of the values represented in the table. 
# choose the name which corresponds to the value which has been counted most. 

mymode <- function(vec){
  mt <- table(vec)
  names(mt)[mt == max(mt)]
}


xyz <- c(1,1,1,1,1,4,5,6,2,2,3,4,1,1,1,1,1)

mymode(xyz)
gmode(xyz)

gmode(customer_churn$PhoneService)
mymode(customer_churn$PhoneService)

#Outleirs

#Min = Q1 - 1.5IQR
#Max = Q3 + 1.5IQR

#<Q1 - 1.5IQR
#> Q3 + 1.5IQR

#.............................

#range
range(c(1,2,3,4,5))
range(customer_churn$MonthlyCharges)


# absolute frequencies
df1 <- data.frame(table(customer_churn$gender))
df2 <- data.frame(table(customer_churn$InternetService))

# relative frequencies
df3 <- data.frame(table(customer_churn$InternetService)/length(customer_churn$InternetService))
df3
# relative frequencies in percent
(table(customer_churn$InternetService)/length(customer_churn$InternetService)) * 100
#2
prop.table(table(customer_churn$InternetService)) * 100

#barplot
barplot(table(customer_churn$gender))
barplot(table(customer_churn$gender)/length(customer_churn$gender))

summary(customer_churn$tenure)

quantile(customer_churn$tenure)
quantile(customer_churn$tenure, probs=c(0,0.25,0.5,0.75,1))

#The interquartile range is defined as the difference between the 75th and 25th quartiles
# is the range of the middle 50% of the data

IQR(customer_churn$tenure)

#variance and standard deviation

var(customer_churn$tenure)
sd(customer_churn$tenure)

customer_churn$month <- 5

var(customer_churn$month)
sd(customer_churn$month)

#Outliers is Normal Distribution 

#>mean + 3SD
#< mean - 3SD

#Standardization and Normalization

customer_churn$sc_mon <-  scale(customer_churn$MonthlyCharges)

mean(customer_churn$MonthlyCharges)
mean(customer_churn$sc_mon)

sd(customer_churn$MonthlyCharges)
sd(customer_churn$sc_mon)

#Normalization

#Normalization is a scaling technique in which values are shifted and rescaled so that they end up 
#ranging between 0 and 1. 
#It is also known as Min-Max scaling.

norml <- function(x) {
  return ((x-min(x))/(max(x)-min(x)))
}

customer_churn$norm_mon <-  norml(customer_churn$MonthlyCharges)

