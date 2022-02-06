setwd("D:/Data Science Course/Online Courses/R Programming/Data Set")
customer_churn = read.csv("customer_churn.csv")

customer_churn <- read.csv("customer_churn.csv", stringsAsFactors = T)
View(customer_churn$MonthlyCharges)
nrow(customer_churn)
ncol(customer_churn)
dim(customer_churn)
max(c(1,2,3,4,5))
max(customer_churn$MonthlyCharges)
mean(customer_churn$MonthlyCharges)
min(c(1,2,3,4,5))
min(customer_churn$MonthlyCharges)
mean(c(1,2,3,4,5))
mean(customer_churn$MonthlyCharges)
summary(customer_churn$MonthlyCharges)
summary(customer_churn$gender)

table(customer_churn$Churn)
table(customer_churn$InternetService)

#...........................................
#rbind(): combining vectors or lists with equal number of columns. 
#All columns must be of the same data type.
#rbind() is the equivalent of stacking data sets on top of each other. 

data.frame(Name=c("Sam","Bob"),Marks=c(97,25)) -> student  
student
#as.character(student$Name) -> student$Name
student <- rbind(student,c("Anne",75))
student

data.frame(Name=c("Sam","Bob"),Marks=c(97,25)) -> student1
data.frame(Name=c("Raj","Penny"),Marks=c(92,65)) -> student2
merge_student <- rbind(student1,student2)
merge_student


#-------------------------------------------------------------

#cbind(): combining vectors or lists with equal number of rows. 
#cbind() is horizontal combination of data. 

data.frame(Name=c("Sam","Bob"),Marks=c(97,25)) -> student
student

student <- cbind(student,Grade=c("A","C"))
student
  
student1 = data.frame(Name=c("Sam","Bob"),Marks=c(97,25)) 
data.frame(Grade=c("A","C"),Subject=c("ML","ML")) -> student3
merge_student2 <- cbind(student1,student3)

merge_student2
#............................

#Merging Dataframes

data.frame(Department=c("Tech","Analytics","Support"),Location=c("Chicago","New York","Boston")) -> Department2

data.frame(Name=c("Sam","Bob","Anne"),Salary=c(75000,105000,120000),Department=c("Tech","Sales","Analytics")) -> Employees

Department2
Employees

merge(Employees,Department2,by="Department") #inner join
merge(Employees,Department2,by="Department",all = T) #outer join


?merge(Employees,Department2,by="Department",all.x  = T) #left join
merge(Employees,Department2,by="Department",all.y  = T) #right join

#x:data frame1.
#y:data frame2.
#by.x, by.y: The names of the columns that are common to both x and y. The default is to use the columns with common names between the two data frames.
#all, all.x, all.y:Logical values that specify the type of merge. The default value is all=FALSE (meaning that only the matching rows are returned).

#Inner Join: To keep only rows that match from the data frames, specify the argument all=FALSE.
#Outer Join:To keep all rows from both data frames, specify all=TRUE.
#Left Join:To include all the rows of your data frame x and only those from y that match, specify x=TRUE.
#Right Join:To include all the rows of your data frame y and only those from x that match, specify y=TRUE.

#---------------------------------------------------

# for(value in that) {
#   do this
# }

a<-1:9

for(i in a) {
  print(i*2)
}

b <- c(23,45,43,11,67,41)

for(i in 1:4){
  print(b[i])
}

#Own defined functions

# func_name <- function(argument) {
#   statements
# }

#my_function <- function() {}

Add_five <- function(x){
  x+5
}

Add_five(3)
Add_five(c(10,15,20))

#############################

mul_fun <- function(a) {
  for(i in 1:a) {
    b <- i*2
    print(b)
  }
}

mul_fun(5)

fn <- function(x) { 
  s=sum(x)
  return(s)	
}

#Calling a function
v1=c(1,2,3,4,5)
v2=c(11,12,13,12,13)
fn(v1)
fn(v2)

#..................................
library(dplyr)
df1 = customer_churn[,c(1:8)]
df1

df2 <- customer_churn[,1:8]
df2

select(customer_churn,2) ->c_2
View(c_2)
select(customer_churn,6) ->c_6
select(customer_churn,1,4,7,12) ->c_bunch
select(customer_churn,5:10) ->c_5_10
select(customer_churn,gender) ->c_gender
select(customer_churn,gender,Partner,tenure) ->c_gpt
select(customer_churn,gender:Contract) ->c_gender_contract

df3 <- slice(customer_churn,1:100)
View(df3)

#select is for column
#slice is for row
