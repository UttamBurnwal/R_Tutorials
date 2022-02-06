library(ggplot2)
library(dplyr) 
library(splitstackshape)
library(corrplot)

?mtcars

# There are seven visualization methods (parameter method) in corrplot package, 
# "circle", "square", "ellipse", "number", "shade", "color", "pie".
# 
# Positive correlations are displayed in blue and negative correlations in red color. 
# Color intensity and the size of the circle are proportional to the correlation coefficients.

#correlation matrix
M <- cor(mtcars)
colnames(M)
str(mtcars)

corrplot(M, method = "circle")
corrplot(M, method = "square")
corrplot(M, method = "ellipse")
corrplot(M, method = "number") # Display the correlation coefficient

#corrplot.mixed() is a wrapped function for mixed visualization style.

corrplot.mixed(M)

corrplot.mixed(M, lower.col = "black", number.cex = 0.7)

# Layout
# There are three layout types (parameter type):
#   
# "full" (default) : display full correlation matrix
# "upper" : display upper triangular of the correlation matrix
# "lower" : display lower triangular of the correlation matrix

corrplot(M, type = "upper")
corrplot(M, type = "lower")
