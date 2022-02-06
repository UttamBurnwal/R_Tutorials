setwd("D:/Data Science Course/Online Courses/R Programming/Data Set")
customer_churn = read.csv("customer_churn.csv")

customer_churn <- read.csv("customer_churn.csv", stringsAsFactors = T)


dim(customer_churn)
names(customer_churn)         
nrow(customer_churn)
ncol(customer_churn)
length(customer_churn$PhoneService)
unique(customer_churn)
length(unique(customer_churn$SeniorCitizen))
df1 = customer_churn[1:1000,1:10]

View(df1)
df2 = customer_churn[,c(1,2,3,5,9)]
colnames(df2)
View(df2)
dim(df2)
df3 = customer_churn[1:1000,]
colnames(df3)
df4 = customer_churn[,c("customerID","SeniorCitizen","PhoneService")]
View(df4)
a <- customer_churn[,c(1,3,6)]

b <- customer_churn[,2:5]

d <- customer_churn[3,]
e <- customer_churn[c(3,5,7),]
f <- customer_churn[5:10,]

df1 <- customer_churn[4:8,2:5]
View(df1)
df2 <- customer_churn[50:60,c(2,3)]
df3 <- customer_churn[c(100:200,1000:2000),5:8]
View(df3)
df4 <- customer_churn[,c("gender","Partner")]

#removing column..........................
customer_churn$customerID = NULL
names(customer_churn)

#multiple columns......
df2 = df1[, -c(1,2)]
View(df2)
View(df1)



# rename a column
# names(df)[names(df) == "old_column_name"] <- "new_column_name"

names(customer_churn)[names(customer_churn) == "gender"] <- "male"
names(customer_churn)[names(customer_churn) == "male"] <- "gender"

names(customer_churn)

#missing values..........

sum(is.na(customer_churn))

sum(is.na(customer_churn$Contract))
colSums(is.na(customer_churn))

#selecting only missing values
miss_info = customer_churn[is.na(customer_churn$TotalCharges),]
View(miss_info)

#extract rows with NA in any columns
?miss_any_rows <- customer_churn[rowSums(is.na(customer_churn)) > 0 , ]
View(miss_any_rows)
?customer_churn$TotalCharges = ifelse(is.na(customer_churn$TotalCharges),0,customer_churn$TotalCharges)
mean(customer_churn$TotalCharges,na.rn =T)
?ifelse
#1
customer_churn$TotalCharges <- ifelse(is.na(customer_churn$TotalCharges),mean(customer_churn$TotalCharges,na.rm = T),customer_churn$TotalCharges)
#2
customer_churn$TotalCharges[is.na(customer_churn$TotalCharges)] <- mean(customer_churn$TotalCharges, na.rm = TRUE)



