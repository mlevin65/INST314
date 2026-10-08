install.packages(c("car", "ggplot2", "ggpubr", "tidyverse", "broom", "AICcmodavg"))
library(ggplot2) 
library(ggpubr)
library(tidyverse)
library(broom) 
library(AICcmodavg)
library(car)

#Question 1- zodiac chi-square goodness of fit test
##null: 
##alternative hypothesis: 

##read in file. can use read.delim, but the tidyverse version tends to work better
zodiac <- read_tsv("zodiac.txt")

### because probabilities are all same you do not need to designate the probabilities
###if probabilities were different, chisq.test(class, p = probabilities vector)
chisq.test(zodiac$Births)

#Results: 

#Question 2- analgesics one-way ANOVA
## omnibus null: 
## Alternative:

#read in file
analgesics <- read_tsv("analgesics.txt")

#Visualize the data#
#create boxplots
boxplot(analgesics$Pain ~ analgesics$Drug,
        data = analgesics,
        main = "Pain level by Analgesic Drug",
        xlab = "Drug",
        ylab = "Pain",
        col = "steelblue",
        border = "black")

#run one-way ANOVA
analgesic_1w <- aov(analgesics$Pain ~ analgesics$Drug)
summary.aov(analgesic_1w)

#Results: 

#Run TukeyHSD to determine which analgesic(s) had different impacts on pain level
TukeyHSD(analgesic_1w)

#Check model assumptions#
plot(analgesic_1w)

#Transform data for normality--it isn't horrible, but this is a good dataset to practice on. Choose either Tukey's ladder or one of the transformations from the announcements#

#formal test for equal variance--does not need to be run, but here is the code#
leveneTest(analgesics$Pain ~ analgesics$Drug, data = analgesics)

#Probabilities for each pairing: 
# Conclusion- write as shown in lecture notes. Make sure you reverse the transformation to report values if you used the transformed data.: 

#Question 3- tv watching

#read in file
tv <- read.csv("tv_watching.csv", colClasses = c("factor", "numeric", "numeric", "factor", "factor", "factor"))

#Visualize the data#
boxplot(tv$TVhours ~ tv$Gender:Athlete,
        data = tv,
        main = "TV hours watched by Gender and Athlete Status",
        xlab = "Group",
        ylab = "TV hours",
        col = "steelblue",
        border = "black", 
        las = 2 #make x-axis labels perpendicular
)

boxplot(tv$Sq.Rt.TV ~ tv$Gender:Athlete,
        data = tv,
        main = "TV hours watched by Gender and Athlete Status",
        xlab = "Group",
        ylab = "TV hours",
        col = "steelblue",
        border = "black", 
        las = 2 #make x-axis labels perpendicular
)

#choose a measure of TV watching based on the visualization. NOTE: The data were transformed for you#

#Run both models
##Additive
tv_add <- aov(tv$Sq.Rt.TV ~ tv$Gender + tv$Athlete)
summary(tv_add)
##With Interaction
tv_interact <- aov(tv$Sq.Rt.TV ~ tv$Gender * tv$Athlete)
summary(tv_interact)

#Compare model output load library(AICcmodavg) if you haven't already
model_set <- list(tv_add, tv_interact)
model_names <- c("tv_add", "tv_interact")
aictab(model_set,model_names)

## Best fit model
##Results: 

## TukeyHSD
TukeyHSD(tv_add)
TukeyHSD(tv_interact)

#Assess assumptions#
plot(tv_add)
plot(tv_interact)

## Results as shown in lecture notes. If you used transformed values, make sure to reverse the transformation when reporting values: 


