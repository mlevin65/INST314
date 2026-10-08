
library(tidyverse)
#Read in data
file_path <- "C:/Users/Miles/Downloads/cancer_in_dogs.csv"
cancer_data <- read.csv(file_path)

#Separate into separate groups#
treatment_group <- filter(cancer_data, order == "2,4-D")
control_group <- filter(cancer_data, order == "no 2,4-D")

#Sum positive cancer
treatment_pos <- sum(treatment_group$response == "cancer")
control_pos <- sum(control_group$response == "cancer")

#Sum negative cancer
treatment_neg <- sum(treatment_group$response == "no cancer")
control_neg <- sum(control_group$response == "no cancer")


#number of people in each group
n_treatment <- nrow(treatment_group)
n_control <- nrow(control_group)


#alpha value 
alpha <- 0.05

#Choose tail and perform binomial exact test


binomial_test <- binom.test(x = c(treatment_pos, control_pos),
                         n = c(treatment_pos + treatment_neg, control_pos +
                                 control_neg),
                         alternative = "greater")

#Print the results
cat("Hypothesis Test Results:\n")
cat("p-value:", binomial_test$p.value, "\n")


# Check the null hypothesis
if (binomial_test$p.value < alpha) {
  cat("Reject the null hypothesis: There is a significant difference in the 
      risk of cancer between dogs exposed to 2,4-D and dogs not exposed 
      to 2,4-D.\n")
} else {
  cat("Fail to reject the null hypothesis: There is no significant difference
      in the risk of cancer between dogs exposed to 2,4-D and dogs not exposed
      to 2,4-D.\n")
}

