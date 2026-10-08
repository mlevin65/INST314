
##Section 2: question 2 G1 and G2 mean grades for  Mathematics
##Load data##
library(tidyverse)
library(Hmisc)
file_path_m <- "C:/Users/Miles/Downloads/student_math.csv"


stu_math <- read.csv(file_path_m)


## Fill missing data: either use na.rm = TRUE ##
##  histogram and smoothed density estimate##
##first create the objects for each year##
mathG2 <- stu_math$G2
mathG3 <- stu_math$G3


###Normality assessments-- two of these are required by the assignment. QQ plot and shapiro wilke are not. 
##histograms--na.rm only needed if running this on the data before it has had na.omit run on it
ggplot()+
  geom_histogram(data = stu_math, na.rm = TRUE,
                 aes(x= mathG2, y=..density..),
                 binwidth = .01,color="black",fill="lightblue")+
  geom_density(data = stu_math, na.rm = TRUE, aes(x = mathG2),
               color="sienna1",size=1.5)


ggplot()+
  geom_histogram(data = stu_math, na.rm = TRUE,
                 aes(x= mathG3, y=..density..),
                 binwidth = .01,color="black",fill="lightblue")+
  geom_density(data = stu_math, na.rm = TRUE, aes(x = mathG3),
               color="sienna1",size=1.5)




##create boxplots 
boxplot(mathG2, mathG3=c("Math G3","Portuguese G3"))

#q-q plots
qqnorm(mathG2)
qqline(mathG2)

qqnorm(mathG3)
qqline(mathG3)


#Shapiro test
shapiro.test(mathG2)
shapiro.test(mathG3)



#clean data by removing the null
#mathG2 <- na.omit(mathG2)
#mathG3 <- na.omit(mathG3)



#display the central tendancy for each year
summary(mathG2)
summary(mathG3)

mean_cl_normal(mathG2)
mean_cl_normal(mathG3)



#Find z-score for each data value#

#G2 z-score vector#
z_scoresMathG2 <- (mathG2-mean(mathG2))/sd(mathG2)


#G3 z-score vector#
z_scoresMathG3 <- (mathG3-mean(mathG3))/sd(mathG3)


print(z_scoresMathG2)
print(z_scoresMathG3)

# paired t-test
result <- t.test(mathG2, mathG3, paired = TRUE, var.equal = TRUE, alternative = "two.sided", )


# Print the result
print(result)
