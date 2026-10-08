
##Section 2: Gender Inequality Index## binwidth pick a bindwith that will divide your data so like .01
##Load data##
library(tidyverse)
library(Hmisc)
file_path <- "C:/Users/Miles/Downloads/GGI2013.csv"

GlobalGap <- read.csv(file_path)

## Fill missing data: either use na.rm = TRUE ##
##  histogram and smoothed density estimate##
##first create the objects for each year##
GGI2013 <- GlobalGap$X2013
GGI2010 <- GlobalGap$X2010
GGI2006 <- GlobalGap$X2006

###Normality assessments-- two of these are required by the assignment. QQ plot and shapiro wilke are not. 
##histograms--na.rm only needed if running this on the data before it has had na.omit run on it
ggplot()+
  geom_histogram(data = GlobalGap, na.rm = TRUE,
                 aes(x= GGI2013, y=..density..),
                 binwidth = .01,color="black",fill="lightblue")+
  geom_density(data = GlobalGap, na.rm = TRUE, aes(x = GGI2013),
               color="sienna1",size=1.5)

ggplot()+
  geom_histogram(data = GlobalGap, na.rm = TRUE,
                 aes(x= GGI2010, y=..density..),
                 binwidth = .01,color="black",fill="lightblue")+
  geom_density(data = GlobalGap, na.rm = TRUE, aes(x = GGI2010),
               color="sienna1",size=1.5)

ggplot()+
  geom_histogram(data = GlobalGap, na.rm = TRUE,
                 aes(x= GGI2006, y=..density..),
                 binwidth = .01,color="black",fill="lightblue")+
  geom_density(data = GlobalGap, na.rm = TRUE, aes(x = GGI2006),
               color="sienna1",size=1.5)



##create boxplots 
boxplot(GGI2006, GGI2010, GGI2013, names=c("2006","2010" , "2013"))

#q-q plots
qqnorm(GGI2006)
qqline(GGI2006)

qqnorm(GGI2010)
qqline(GGI2010)

qqnorm(GGI2013)
qqline(GGI2013)

#Shapiro test
shapiro.test(GGI2006)
shapiro.test(GGI2010)
shapiro.test(GGI2013)


#clean data by removing the missing years.
GGI2013 <- na.omit(GGI2013)
GGI2010 <- na.omit(GGI2010)
GGI2006 <- na.omit(GGI2006)


#display the central tendancy for each year
summary(GGI2006)
summary(GGI2010)
summary(GGI2013)

mean_cl_normal(GGI2006)
mean_cl_normal(GGI2010)
mean_cl_normal(GGI2013)


#Find z-score for each data value#

#2006 z-score vector#
z_scoresGGI2006 <- (GGI2006-mean(GGI2006))/sd(GGI2006)


#2010 z-score vector#
z_scoresGGI2010 <- (GGI2010-mean(GGI2010))/sd(GGI2010)


#2013 z-score vector#
z_scoresGGI2013 <- (GGI2013-mean(GGI2013))/sd(GGI2013)

print(z_scoresGGI2006)
print(z_scoresGGI2010)
print(z_scoresGGI2013)

# t-test
#The t.test() function in R uses the following syntax:

#t.test(x, y, alternative = “two.sided”, mu = 0, paired = FALSE, var.equal = FALSE, conf.level = 0.95)

#where:

#  x, y: The names of the two vectors that contain the data.
#alternative: The alternative hypothesis. Options include “two.sided”, “less”, or “greater.”
#mu: The value assumed to be the true difference in means.
#paired: Whether or not to use a paired t-test.
#var.equal: Whether or not the variances are equal between the two groups.
#conf.level: The confidence level to use for the test.

#one sample t.test(data, mu=??) need to add the tail of the test (alternative = "less")
#t.test(Q1_22,Q1_23, var.equal = FALSE, alternative = "less", conf.level = .95)
#a always =.05
#t.test(Q1_22,Q1_23, paired = TRUE, var.equal = FALSE, alternative = "less", conf.level = .95)
t.test(GGI2006,GGI2013, paired = TRUE, var.equal = FALSE, alternative = "less", )

# paired t-test
#t.test(data1,data2, paired = TRUE, alternative = "?")
#create boxplots
boxplot(GGI2006, GGI2010, GGI2013, names=c("2006", "2010", "2013"))