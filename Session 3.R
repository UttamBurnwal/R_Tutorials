a = c(1,2,3,4,5)
a
b=LETTERS
b
c = LETTERS[seq(1,10)]
c
letters
data1 = c(TRUE, FALSE, TRUE, FALSE)
data1
data2 = c(T,F,T,F)
data2
?class(data1)
1>2
f = c(10:20,34,39)
f
chart1 = c('this', "is", "sparta")
chart1
?ls.str()
?rm(a)
#.....................For deleting...........
#rm(list=ls()) will delete everything
num1= c(1,3,6)
num1
rm(num1)

#..........length of a vector.................
length(data1)

#.............data type...............
class(data1)
class(b)
class(f)

vec1 = c(1,5,2,7,6,3)
vec1
vec1[5]
vec1[2,3,6] #cannot use this as it is one dimensional

vec1[c(2,3,6)]

vec1[1:3]

vec1[-1]

#.........................sum...........
sum(1:5)
sum(1:5, 6)
sum(1:5, NA, 6, na.rm = TRUE)
?na.rm = T

#..............missing values......
num1 = c(NA, 2,5,7, 8, NA,NA)
num1
is.na(num1) #logical function

sum(is.na(num1)) # add the number of missing vales (total number)

num1[1]

num1[is.na(num1)] #list of missing values
num1[!is.na(num1)] #list of given values

which(is.na(num1)) #position of missing values
which(!is.na(num1)) #position of non-missing values

f
sum(f)
mean(f)

num1

sum(num1)

mean(num1)

mean(num1, na.rm=T)

sum(num1, na.rm=T)

#................ifelse...(conditions).....

?ifelse(is.na(num1), 0, num1)
num1 = ifelse(is.na(num1),0, num1) 
num1
mean(num1)
sum(num1)



#.........LIST.............................
my_list1 <- list(1,"a",TRUE)
my_list2 <- list(c(1,2),c("a","b"),c(TRUE,FALSE))
#print the lists
my_list1
my_list2

#access elements of a list
my_list1[2]
my_list2[2]
my_list2[[1]][2]

#Another list
Fruit_list <- list(Apple = 85, Banana = 45, Guava = 100)

Fruit_list
Fruit_list$Apple

#..............Matrix.........

mat1<-matrix(c(1,2,3,4),nrow=2,byrow = F)
mat1
mat2<-matrix(c("a","b","c","d"),nrow=2,byrow = T)
mat2
mat3<-matrix(c(T,F,T,F),nrow=2,byrow = T)
mat3
?matrix
#............ ARRAY..........

a1 <- array(1:24,dim = c(2,4,3))
a1
a2 = array(1:6, dim = c (1,2,3))
a2




#FACTOR  
my_data<-c("Male","Female","Female","Male")
my_data <- as.factor(my_data)
class(my_data)

#-------------------------------------------------
# DATAFRAME

?df <- data.frame(Name=c("Sam","Bob"),Age=c(32,48),stringsAsFactors=T)
df
class(df)
df1 = data.frame(Name = c("Uttam", "Karan", "Shivaam"), Age = c(22,23,25), stringsAsFactors = F)
df1
?data.frame

s = c( 1, 2,"a","b")
class(s)
