
##Section 2 question 1: mean G3 grades for Mathematics 
##Load data##
library(tidyverse)
library(Hmisc)
file_path_m <- "C:/Users/Miles/Downloads/student_math.csv"
file_path_p <- "C:/Users/Miles/Downloads/student_por.csv"

stu_math <- read.csv(file_path_m)
stu_por<- read.csv(file_path_p)

## Fill missing data: either use na.rm = TRUE ##
##  histogram and smoothed density estimate##
##first create the objects for each year##
mathG3 <- stu_math$G3
porG3 <- stu_por$G3


###Normality assessments-- two of these are required by the assignment. QQ plot and shapiro wilke are not. 
##histograms--na.rm only needed if running this on the data before it has had na.omit run on it
ggplot()+
  geom_histogram(data = stu_math, na.rm = TRUE,
                 aes(x= mathG3, y=..density..),
                 binwidth = .01,color="black",fill="lightblue")+
  geom_density(data = stu_math, na.rm = TRUE, aes(x = mathG3),
               color="sienna1",size=1.5)


ggplot()+
  geom_histogram(data = stu_por, na.rm = TRUE,
                 aes(x= porG3, y=..density..),
                 binwidth = .01,color="black",fill="lightblue")+
  geom_density(data = stu_por, na.rm = TRUE, aes(x = porG3),
               color="sienna1",size=1.5)




##create boxplots 
boxplot(mathG3, porG3=c("Math G3","Portuguese G3"))

#q-q plots
qqnorm(mathG3)
qqline(mathG3)

qqnorm(porG3)
qqline(porG3)


#Shapiro test
shapiro.test(mathG3)
shapiro.test(porG3)



#clean data by removing the null.
#mathG3 <- na.omit(mathG3)
#porG3 <- na.omit(porG3)



#display the central tendancy for each year
summary(mathG3)
summary(porG3)

mean_cl_normal(mathG3)
mean_cl_normal(porG3)



#Find z-score for each data value#

#MathG3 z-score vector#
z_scoresMathG3 <- (mathG3-mean(mathG3))/sd(mathG3)


#PorG3 z-score vector#
z_scoresPorG3 <- (porG3-mean(porG3))/sd(porG3)


print(z_scoresMathG3)
print(z_scoresPorG3)




# unpaired t-test
result <- t.test(mathG3, porG3, paired = FALSE, var.equal = TRUE, alternative = "two.sided", )


# Print the result
print(result)
