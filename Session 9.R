setwd("D:/Data Science Course/Online Courses/R Programming/Data Set")

customer_churn <- read.csv("customer_churn.csv", stringsAsFactors = T)
install.packages("splitstackshape")
library(ggplot2)
library(dplyr) 
install.packages("corrplot")
library(splitstackshape)
library(corrplot)

ggplot(data=customer_churn,aes(x=tenure,col=Partner))+
  geom_histogram(fill="white",alpha=0.5)

ggplot(data=customer_churn,aes(x=tenure,col=Partner))+
  geom_histogram(fill="white",alpha=0.5, position = "identity")

#..................................

die <- 1:6
die

sample(x=die,size = 1)

sample(x=die,size = 2)

sample(x=die,size = 2, replace = T)

#......................................

sub_df <- stratified(customer_churn, "Churn", 1000)
View(sub_df)

sub_df2 <- stratified(customer_churn, "Churn", .1)
View(sub_df2)

#using dplyr package

sub_df3 <- customer_churn %>%
  group_by(Churn) %>%
  sample_n(1000)

sub_df4 <- customer_churn %>% group_by(Churn) %>% sample_frac(.1)
