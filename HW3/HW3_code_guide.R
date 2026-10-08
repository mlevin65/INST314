##Load data##
library(tidyverse)
library(Hmisc)
GlobalGap <- read.csv("GGI2013.csv")

#remove rows with missing data
GlobalGap_O <- na.omit(GlobalGap)

##  histogram and smoothed density estimate##

###Normality assessments-- two of these are required by the assignment. QQ plot and shapiro wilke are not. 
##histograms--na.rm only needed if running this on the data before it has had na.omit run on it
ggplot()+
  geom_histogram(data = GlobalGap_O, na.rm = TRUE,
                 aes(x= X2013, y=..density..),
                 binwidth = 0.01,color="black",fill="lightblue")+
  geom_density(data = GlobalGap_O, na.rm = TRUE, aes(x = X2013),
               color="sienna1",size=1.5)


##create boxplots 

boxplot(GlobalGap_O$X2006, GlobalGap_O$X2010, GlobalGap_O$X2013, names=c("2006","2010" , "2013"))

#Q-Q Plots
qqnorm(GlobalGap_O$X2013)
qqline(GlobalGap_O$X2013)


#Shapiro-Wilkes
shapiro.test(GlobalGap_O$X2006)


##Summary stats for each year##
summary(GlobalGap_O$X2013)

#confidence interval for each mean is provided by summary stats and by the boxplot, but can also be directly calculated
mean_cl_normal(GlobalGap_O$X2006)

#Find z-score for each data value#

#2006 z-score vector#
z_scores2006 <- (GlobalGap_O$X2006-mean(GlobalGap_O$X2006))/sd(GlobalGap_O$X2006)
z_scores2006


# paired t-test

t.test(GlobalGap_O$X2006, GlobalGap_O$X2013, paired = TRUE, var.equal = FALSE, alternative = "Choose something")


