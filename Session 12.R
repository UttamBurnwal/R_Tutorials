#Y = b0+b1x   + e
#Variation in Y = Variation in Y that's explained by model + Variation in Y that's not explained by the model
#SST = SSR + SSE

#R Squared = SSR/ SST = 1 - SSE/SST
setwd("D:/Data Science Course/Online Courses/R Programming/Data Set")

customer_churn <- read.csv("customer_churn.csv", stringsAsFactors = T)

install.packages(c("caTools","ModelMetrics"))

library(caTools)
library(ModelMetrics)
library(ggplot2)

#Train and Test

rows = seq(1,nrow(customer_churn))

trainRows = sample(rows,(70*nrow(customer_churn))/100)

#trainRows = sample(rows,0.7*nrow(customer_churn))

train1 = customer_churn[trainRows,] 
test1 = customer_churn[-trainRows,]
