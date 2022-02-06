setwd("D:/Data Science Course/Online Courses/R Programming/Data Set")

customer_churn <- read.csv("customer_churn.csv", stringsAsFactors = T)
library(caTools)
library(ModelMetrics)
library(ggplot2)

#another way of splitting 
rows = seq(1,nrow(customer_churn))

trainRows = sample(rows,(70*nrow(customer_churn))/100)

#trainRows = sample(rows,0.7*nrow(customer_churn))

train1 = customer_churn[trainRows,] 
test1 = customer_churn[-trainRows,]

#Linear regression model - training

#lm(Y ~ X1+X2, data=training_data)-> model1

lm(MonthlyCharges ~ tenure, data=train1)-> model1

#predict on test

predict(model1, newdata=test1)->predicted_values

#data frame - test actuals and predicted ones
data.frame(Actual=test1$MonthlyCharges,Predicted=predicted_values)->final_data

#Residual
final_data$Actual - final_data$Predicted -> final_data$error

#RMSE
sqrt(mean((final_data$error)^2)) -> rmse1
rmse1

# Root Mean Squared Error 
# It's the square root of the average of squared differences between actual and predicted values
# Since the errors are squared before they are averaged, 
# the RMSE gives a relatively high weight to large errors.
# RMSE is useful when large errors are particularly undesirable.

rmse(final_data$Actual,final_data$Predicted)

#MAE
mae(final_data$Actual,final_data$Predicted)

# Mean Absolute Error
# all individual differences are weighted equally in the average

summary(model1)

#.........................................................

train1$customerID <- NULL
test1$customerID <- NULL

lm(MonthlyCharges~tenure+PhoneService+InternetService,data=train1)-> model2

#summary
summary(model2)

predict(model2,newdata=test1)-> result
cbind(Actual=test1$MonthlyCharges,Predicted=result)->final_data2
as.data.frame(final_data2)-> final_data2

(final_data2$Actual-final_data2$Predicted)->error2

cbind(final_data2,error2) -> final_data2

sqrt(mean((final_data2$error2)^2))-> rmse2
rmse2

rmse(final_data2$Actual,final_data2$Predicted)

#MAE
mae(final_data2$Actual,final_data2$Predicted)

#................................................

#Why logistoc regression is regression when its categorical

#p = e^(b0+b1x) -(1)

#p = e^(b0+b1x) / (e^(b0+b1x) + 1)


#p = e^y/ (e^y +1) -> 2 logit function

#q = 1-p
#q = 1 - ( e^y/ (e^y +1))  ->3

#2/3

#p/1-p = e^y

#log on both sides

#log(p/1-p) = y = b0+b1x

