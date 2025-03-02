library(tidyverse)

# Load dataset from Github
amazon_data <- read.csv(
  paste("https://raw.githubusercontent.com/info201b-au20/project-",
    "AmazonPricing/gh-pages/data/Amazon-Ranking-Analysis.csv?token=",
    "AKQ3B6Q3UEQDBPM4IBQS3B27W2R5W",
    sep = ""
  )
)
summary_info <- list()

# Calculate the total number of rows in the dataset
summary_info$num_observations <- nrow(amazon_data)

# calculate the largest difference between the cost on amazon web page vs cost
# in the cart(after shipping has been added)
summary_info$max_cost_difference <- amazon_data %>%
  mutate(discrepancy = CorrectedPrice - ScrapedIndexPrice) %>%
  filter(discrepancy == max(discrepancy, na.rm = T)) %>%
  pull(discrepancy)

# Calculate the total number of unique products in the database
summary_info$num_unique_products <- amazon_data %>%
  group_by(ProductName) %>%
  count(ProductName) %>%
  nrow()

# calculates the total number of vendors in the database that use "Filled by
# Amazon"(FBA)
summary_info$total_num_fba_vendor <- amazon_data %>%
  filter(BBVendorType == "FBA") %>%
  nrow()

# The total number of observations that have been sold and shipped by Amazon.
summary_info$all_amazon <- amazon_data %>%
  filter(BBVendor == "Ships from and sold by Amazon.com.") %>%
  nrow()
