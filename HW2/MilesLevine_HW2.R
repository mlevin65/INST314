
library(tidyverse)
#Read in data
file_path <- "C:/Users/Miles/Downloads/biontech_adolescents.csv"
vaccine_data <- read.csv(file_path)
##vaccine_data <- read.csv(biontech_adolescents.csv)

#Separate into separate groups#
treatment_group <- filter(vaccine_data, group == "vaccine")
control_group <- filter(vaccine_data, group == "placebo")

#Sum positive COVID tests
treatment_pos <- sum(treatment_group$outcome == "no COVID-19")
control_pos <- sum(control_group$outcome == "no COVID-19")

#number of people in each group
n_treatment <- nrow(treatment_group)
n_control <- nrow(control_group)


#alpha value 
alpha <- 0.05

#Choose tail and perform binomial exact test

binomial_test <- binom.test(treatment_pos, n_treatment, control_pos/n_control,
                            alternative = "greater")



#Print the results
cat("Hypothesis Test Results:\n")
cat("p-value:", binomial_test$p.value, "\n")


# Check the null hypothesis
if (binomial_test$p.value < alpha) {
  cat("Reject the null hypothesis: The number of positive COVID tests differs significantly across the treatment and control groups.\n")
} else {
  cat("Fail to reject the null hypothesis: The number of positive COVID tests does not significantly differ between the treatment and control groups.\n")
}

