setwd("D:/Data Science Course/Online Courses/R Programming/Data Set")

customer_churn <- read.csv("customer_churn.csv", stringsAsFactors = T)
colnames(customer_churn)
library(ggplot2)
library(dplyr)

#------------------- GGPLOT Visualizations -----------------------------------

#ggplot(data = data_set, mapping = aes(<mapping>)) + <geom_function>()
#geoms = Geometric elements

ggplot(data = customer_churn,aes(x=tenure))+geom_histogram()  
ggplot(data = customer_churn, aes(x=tenure))+geom_histogram(bins = 50)

ggplot(data = customer_churn, aes(x=tenure))+geom_histogram(bins=20,fill="palegreen4",col="black")

ggplot(customer_churn,aes(x=tenure)) + geom_histogram(bins=20, fill= "steelblue4",col="white") +
  xlab("Tenure of customers") + ylab("Frequency") + ggtitle("Distribution of Tenure of customers")

ggplot(data = customer_churn, aes(x=tenure)) +
  geom_histogram(bins=20,fill="steelblue3",col="black",alpha=0.5) +
  stat_bin(bins=20,  color="black", geom="text", aes(label=..count..), vjust = -0.5) +
  labs(title = "Tenure Distribution", x="Tenure",y="Frequency") +
  theme(plot.title = element_text(hjust=0.5,face="bold")) 

ggplot(data = customer_churn, aes(x=MonthlyCharges)) +
  geom_histogram(bins=20,fill="steelblue4",col="black",alpha=0.5) +
  stat_bin(bins=20, geom="text", color="black", aes(label=..count..), vjust = -0.5) +
  labs(title = "Monthly Charges Distribution", x="Monthly Charges",y="Frequency") +
  theme(plot.title = element_text(hjust=0.5,size=18))

ggplot(customer_churn,aes(x=tenure)) + geom_histogram(binwidth=5, boundary = 0,fill= "steelblue4",col="white") +   
  xlab("Tenure of customers") + ylab("Frequency") + ggtitle("Distribution of Tenure of customers")

#binwidth - width of 5 and boundary = 0 ensures that the binning starts at an integer value

#---------------------- Bar Plot ---------------------------------

ggplot(data = customer_churn,aes(x=Dependents)) + geom_bar()
ggplot(data = customer_churn,aes(x=Dependents)) + geom_bar(fill="chocolate")

ggplot(data = customer_churn,aes(x=Dependents,fill=DeviceProtection))+geom_bar() + 
  labs(title = "Bar chart", x="Dependents",y="Frequency")

table(customer_churn$Dependents)
table(customer_churn$Dependents,customer_churn$DeviceProtection)

ggplot(data = customer_churn,aes(x=Dependents,fill=DeviceProtection)) +
  geom_bar(position="dodge",col="black")

#-------------------- Scatter Plot -----------------------------------------

#assign plot to a variable
scatter <- ggplot(data = customer_churn,aes(y=TotalCharges,x=tenure)) 
scatter
#draw the plot
#correct syntax for adding layers
scatter +
  geom_point()  

#this will not add the new layer
scatter
+ geom_point()

#adding transparency (alpha) to avoid overplotting
scatter +
  geom_point(alpha = 0.3)

#adding color
scatter +
  geom_point(alpha = 0.3, col = "steelblue4")

ggplot(data = customer_churn,aes(y=TotalCharges,x=tenure)) + geom_point(col="slateblue3")
ggplot(data = customer_churn,aes(y=TotalCharges,x=tenure, col=Partner)) + geom_point() 

ggplot(data = customer_churn,aes(y=TotalCharges,x=tenure, col=InternetService))+geom_point()

ggplot(data = customer_churn,aes(y=TotalCharges,x=tenure, col=InternetService))+geom_point()+
  scale_color_manual(values = c("steelblue4","sienna4","goldenrod"))+
  ggtitle("Relationship between tenure and total charges")

ggplot(data = customer_churn,aes(y=TotalCharges,x=tenure, col=OnlineSecurity))+geom_point()

#------------------------ BOXPLOT ------------------------


ggplot(data = customer_churn,aes(y=MonthlyCharges,x=Dependents))+geom_boxplot()  
ggplot(data = customer_churn,aes(y=MonthlyCharges,x=Dependents))+geom_boxplot(fill="yellowgreen")

ggplot(data = customer_churn,aes(y=MonthlyCharges,x=InternetService))+geom_boxplot()
ggplot(data = customer_churn,aes(y=MonthlyCharges,x=InternetService))+geom_boxplot(fill="violetred4")

ggplot(data = customer_churn,aes(y=MonthlyCharges,x=PaymentMethod))+geom_boxplot()

ggplot(data = customer_churn,aes(y=MonthlyCharges,x=PaymentMethod,fill=PaperlessBilling))+geom_boxplot()

ggplot(data = customer_churn,aes(y=MonthlyCharges,x=""))+geom_boxplot()

ggplot(data = customer_churn,aes(x=tenure,fill=InternetService))+geom_histogram(bins = 10,col="black") +
  facet_grid(~InternetService) + ggtitle("Tenure Histogram- Internet Service Wise") +
  xlab("Tenure") + ylab("Count") + theme_minimal()

ggplot(data = customer_churn,aes(y=TotalCharges,x=tenure, col=Contract)) + geom_point() + 
  facet_grid(~Contract) + xlab("Tenure") + ylab("Total Charges") +
  ggtitle("Total Charges vs. Tenure") + theme_bw()

?mtcars


df <- data.frame(table(customer_churn$Churn))

ggplot(df,aes(x=Var1,y=Freq,fill=Var1)) + geom_bar(stat="identity")+ 
  geom_text(aes(label=Freq),vjust = 1.6)+
  xlab("Churn") + ggtitle("Churn Distribution")
