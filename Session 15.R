setwd("D:/Data Science Course/R Programming Materials/Data Set")
customer_churn = read.csv("customer_churn.csv", stringsAsFactors = T)
library(caTools)
install.packages("ROCR")
library(ROCR)
install.packages("caret")
library(caret)
install.packages('e1071')
library(e1071)
library(ggplot2)

customer_churn$Churn_new <- ifelse(customer_churn$Churn == "Yes",1,0)
customer_churn$Churn_new <- as.factor(customer_churn$Churn_new)

#Split the data into train and test data sets

rows=seq(1,nrow(customer_churn))

trainRows=sample(rows,(70*nrow(customer_churn))/100)
train1 = customer_churn[trainRows,] 
test1 = customer_churn[-trainRows,]

glm(Churn_new ~ MonthlyCharges+Partner+InternetService, data=train1, family = "binomial")-> mod_log

#summary of the model
summary(mod_log)

#AIC (Akaike Information Criteria) - 
#The analogous metric of adjusted R² in logistic regression is AIC. 
#AIC is the measure of fit which penalizes model for the number of model coefficients. 
#Therefore, we always prefer model with minimum AIC value.

# Null Deviance and Residual Deviance - 
# Null Deviance indicates the response predicted by a model with nothing but an intercept. Lower the value, better the model. 
# Residual deviance indicates the response predicted by a model on adding independent variables. Lower the value, better the model.

#prediction on test

predict(mod_log, test1, type="response")->result_log

range(result_log)

table(test1$Churn_new, result_log>=0.4)

final_data <- data.frame(Actual=test1$Churn_new,Predicted=result_log)

final_data$predit_values <- ifelse(final_data$Predicted>=0.4,1,0)
final_data$predit_values <- as.factor(final_data$predit_values)

confusionMatrix(final_data$predit_values, final_data$Actual)


prediction(result_log,test1$Churn_new) -> predict_log

performance(predict_log,"tpr","fpr") -> roc_curve
plot(roc_curve)
plot(roc_curve, colorize=T)

auc.tmp <- performance(predict_log,"auc"); auc <- as.numeric(auc.tmp@y.values)
auc

#Higher the area under curve, better the prediction power of the model.
#Recall/ sensitivity/ TPR
#TNR = Specificity
#TN/ TN+FP
#FScore or F1Score= 2*precision*recall / Precision + recall

#..............................................
#Decision Tree and Random Forest

install.packages(c("C50","rpart","rpart.plot","party","randomForest"))

#C5.0 Algorithm
library(C50)
#Recursive Partitioning And Regression Trees
library(rpart)
library(rpart.plot)
library(party)
#Random Forest Algorithm
library(randomForest)

