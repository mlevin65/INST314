install.packages(c("car", "ggplot2", "ggpubr", "tidyverse", "broom", "AICcmodavg", "rcompanion"))
library(ggplot2) 
library(ggpubr)
library(tidyverse)
library(broom) 
library(AICcmodavg)
library(car)
library(rcompanion)

file_path_1 <- "C:/Users/Miles/Downloads/uci_student.csv"

#Question 1- chi-square goodness of fit test


dataMerged <- read.csv(file_path_1)

# Sum the number of women who fail and the number of men who fail
total_failures <- sum(dataMerged$failures.x[dataMerged$sex == "F"]) + sum(dataMerged$failures.x[dataMerged$sex == "M"])


# Calculate the expected frequency for each gender (assuming equal expected frequencies)
expected_freq <- total_failures / 2

# Create a contingency table
observed_freq <- table(dataMerged$sex, dataMerged$failures.x)

# Perform Chi-Squared Goodness of Fit Test
chi_sq_test <- chisq.test(x = observed_freq)

# Print the result
print(chi_sq_test)

#Question 2- one-way ANOVA


#Visualize the data#
#create boxplots
boxplot(dataMerged$failures.x ~ dataMerged$Walc.x,
        data = dataMerged,
        main = "Number of failures vs weekly alc consumption",
        xlab = "failures.x",
        ylab = "Walc.x",
        col = "steelblue",
        border = "black")

# Convert factor variables to numeric
dataMerged$failures.x <- as.numeric(as.character(dataMerged$failures.x))
dataMerged$Walc.x <- as.numeric(as.character(dataMerged$Walc.x))

# Convert Walc.x to factor
dataMerged$Walc.x <- as.factor(dataMerged$Walc.x)

# Run one-way ANOVA
dataMerged_1w <- aov(failures.x ~ Walc.x, data = dataMerged)
summary(dataMerged_1w)
# Check ANOVA summary
anova_summary <- summary(dataMerged_1w)

# Run Tukey's HSD test
tukey_result <- TukeyHSD(dataMerged_1w)

# Print the Tukey's HSD test result
print(tukey_result)


#Check model assumptions#
plot(dataMerged_1w)


#Transform data for normality

T_tuk =
  transformTukey(dataMerged$failures.x, plotit=FALSE)

boxplot(T_tuk ~ dataMerged$Walc.x,
        data = dataMerged ,
        main = "failures.x level by Analgesic Walc.x",
        xlab = "Walc.x",
        ylab = "failures.x",
        col = "steelblue",
        border = "black")
dataMerged_2w <- aov(T_tuk ~ dataMerged$Walc.x)
summary.aov(dataMerged_2w)
TukeyHSD(dataMerged_2w)
plot(dataMerged_2w)

#formal test for equal variance--does not need to be run, but here is the code#
leveneTest(dataMerged$failures.x ~ dataMerged$Walc.x, data = dataMerged)

#Question 3- T-test 




# Extract the Workday Alcohol Consumption for Portuguese and Math
alc_portuguese <- dataMerged$Dalc.y
alc_math <- dataMerged$Dalc.x


# Shapiro test for normality
shapiro.test(alc_portuguese)
shapiro.test(alc_math)


# Create boxplots 
boxplot(alc_math, alc_portuguese, names=c("Math", "Portuguese"),
        main="Workday Alcohol Consumption Comparison",
        xlab="Student Type", ylab="Alcohol Consumption")

#q-q plots
qqnorm(alc_math)
qqline(alc_math)

qqnorm(alc_portuguese)
qqline(alc_portuguese)



#display the central tendancy for each year
summary(alc_math)
summary(alc_portuguese)

mean_cl_normal(alc_math)
mean_cl_normal(alc_portuguese)


# Perform the variance test
variance_test <- var.test(alc_math, alc_portuguese)

# Print the result
print(variance_test)


# Perform the independent samples t-test
result <- t.test(alc_math, alc_portuguese, paired = FALSE, var.equal = TRUE, alternative = "two.sided", )

# Print the result
print(result)



