setwd("D:/Data Science Course/Online Courses/R Programming/Data Set")

customer_churn <- read.csv("customer_churn.csv", stringsAsFactors = T)
View(customer_churn)
library(dplyr)
select(customer_churn,2) ->c_2
select(customer_churn,6) ->c_6
select(customer_churn,1,4,7,12) ->c_bunch
select(customer_churn,5:10) ->c_5_10
select(customer_churn,gender) ->c_gender
select(customer_churn,gender,Partner,tenure) ->c_gpt
select(customer_churn,gender:Contract) ->c_gender_contract

select(customer_churn,starts_with("Stream")) -> c_stream
View(c_stream)
select(customer_churn,ends_with("Charges")) -> c_charges
View(c_charges)
select(customer_churn,contains("ing")) -> c_ing

#.......................................

filter(customer_churn,gender=="Female") -> c_female  
View(c_female)
filter(customer_churn, MonthlyCharges>100) -> c_high_paying_customers
View(c_high_paying_customers)
filter(customer_churn,gender=="Female" & MonthlyCharges>100)->c_high_female
View(c_high_female)
filter(customer_churn,gender=="Female" , MonthlyCharges>100)->c_high_female1

filter(customer_churn,StreamingTV=="Yes" & StreamingMovies=="Yes")->c_stream
View(c_stream)
filter(customer_churn,tenure>50 & InternetService == "DSL" & Contract=="One year") -> c_tic
filter(customer_churn,PaymentMethod=="Electronic check" | PaymentMethod=="Mailed check" ) -> c_pay
filter(customer_churn,(Contract=="One year" | Contract=="Two year") & gender=="Female"  )->c_con_gen
filter(customer_churn,(InternetService == "DSL" | InternetService == "Fiber optic") &(tenure>50 & MonthlyCharges >100))->c_complicated

#base
df_contract <- customer_churn[customer_churn$Contract %in% c("One year","Two year"), ]
View(df_contract)

#dplyr
df_contract2 <- filter(customer_churn,Contract %in% c("One year","Two year"))
View(df_contract2)
df_contract3 <- filter(customer_churn,!Contract %in% c("One year","Two year"))

# Typical Operators to filter rows:
# ==
# !=
# > 
# <
# >=
# <=
# %in%

#Filter NA's

na_df <- filter(customer_churn,is.na(TotalCharges))

#.................................................

customer_churn <- mutate(customer_churn,customer_category=ifelse(MonthlyCharges < 45, "Low_Paying", 
                                                                 ifelse(MonthlyCharges < 90,"Medium_paying","High_paying")))
View(customer_churn)
class(customer_churn$customer_category)
customer_churn$customer_category <- as.factor(customer_churn$customer_category)

#dplyr
customer_churn <- mutate(customer_churn,ID=1:7043,ID2 = 2)
View(customer_churn)
#base
customer_churn$ID <- 1:nrow(customer_churn)

customer_churn$churn_new <- ifelse(customer_churn$Churn=="Yes",1,0)

#.....................................

sample_n(customer_churn,10)->random_10
View(random_10)
sample_n(customer_churn,100)->random_100

sample_frac(customer_churn,0.1)->random_10percent
sample_frac(customer_churn,0.5)->random_50percent

#Removing Columns

df1 <- customer_churn[,c(1,4,5,6,7,12)]
#remove columns
df1$DeviceProtection <- NULL
df2 <- df1[,-c(1,2)]

#................................

summarise(customer_churn,mean_tenure=mean(tenure))  
summarise(customer_churn,mean_MC=mean(MonthlyCharges))
summarise(customer_churn,mean_TC=mean(TotalCharges,na.rm=T))

#base
round(mean(customer_churn$tenure),2)

#......................................

df1 <- summarise(group_by(customer_churn,InternetService),mean_tenure=mean(tenure))  
View(df1)
df2 <- summarise(group_by(customer_churn,Partner),mean_MonthlyCharges=mean(MonthlyCharges))
df3 <- summarise(group_by(customer_churn,InternetService),mean_MonthlyCharges=mean(MonthlyCharges))

#.......................................

new <- arrange(customer_churn, MonthlyCharges)
View(new)
new1 <- arrange(customer_churn, desc(MonthlyCharges))

#-------------- remove duplicate rows ----------------

#based on all the columns
cust <- customer_churn %>% distinct()

#..................................

customer_churn %>% select(1:5) -> c_15 

#select rows 
#base
customer_churn[1:10,] -> df5
#dplyr
customer_churn %>% slice(1:10) -> df_110

customer_churn %>% slice_head(n=3) -> df_3
customer_churn %>% slice_tail(n=3) -> df_3

#rename columns
customer_churn %>% rename(customer_ID =customerID) -> customer_churn

customer_churn %>% select(1:5) -> c_15 

#select rows 
#base
customer_churn[1:10,] -> df5
#dplyr
customer_churn %>% slice(1:10) -> df_110

customer_churn %>% slice_head(n=3) -> df_3
customer_churn %>% slice_tail(n=3) -> df_3

#rename columns
customer_churn %>% rename(customer_ID =customerID) -> customer_churn

customer_churn %>% 
  select(1:5) %>% 
  filter( gender =="Male") -> c_15_male

customer_churn %>% 
  filter(InternetService=="DSL") %>% 
  group_by(gender) %>% 
  summarise(mean_mc = mean(MonthlyCharges)) -> df7

customer_churn %>% 
  group_by(InternetService) %>% 
  summarise(mean_mc = mean(MonthlyCharges)) -> df

customer_churn %>% 
  group_by(PaymentMethod) %>% 
  summarise(mean_tenure = mean(tenure), count = n()) -> new_df

customer_churn %>% group_by(PaymentMethod) %>% summarise(mean_tenure=mean(tenure)) %>% arrange(desc(PaymentMethod)) -> df8
customer_churn %>% select(1,2,10:21) %>% filter(Contract=="One year" | Contract=="Two year") %>% arrange(Contract) -> c_contract
customer_churn %>% filter(PaperlessBilling=="No") %>% group_by(TechSupport) %>%summarise(mean_tenure=mean(tenure)) -> df9

