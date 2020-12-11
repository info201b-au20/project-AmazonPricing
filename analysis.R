library(tidyverse)

# Load the data from GitHub

amazon_data <- read.csv("https://raw.githubusercontent.com/info201b-au20/project-AmazonPricing/gh-pages/data/Amazon-Ranking-Analysis.csv?token=ARIOKKKUVW5AWQDWHRFCD427ZXB26")

## First Chart

# Check the number of total unique products is 250
check <- amazon_data %>%
  group_by(ProductName) %>%
  count(unique(ProductName))

# We will be examining the top 3 unique products which means the top 272 Indexes
top_3_products <- amazon_data %>%
  filter(Index <= 20) %>%
  mutate(ProductName = strtrim(ProductName, 30))

# Create a dot plot that shows the variation of cost within the top 5 Products

first_chart <- ggplot(top_3_products, aes(ScrapedIndexPrice, ProductName)) +
  geom_point(aes(color = ScrapedIndexVendor)) +
  scale_x_continuous(breaks = seq(0, 75, 5)) +
  labs(color = "Vendor") +
  xlab("Scraped Index Price") +
  ylab("Product Name")


## Second Chart

source("scripts/second_chart.R")

## Third Chart

# create a dataset
# Load data from GitHub
source("scripts/aggregate_table.R")

top_20_index_ratios <- aggregate_table %>%
  filter(ScrapedIndex <= 20)

third_chart <- ggplot(top_20_index_ratios, aes(
  fill = BBVendorType, y = ratio,
  x = ScrapedIndex
)) +
  geom_bar(position = "fill", stat = "identity") +
  ggtitle(paste("Vendor Types for top 20 Indexed Products on Amazon ",
    "across 162 Categories",
    sep = ""
  )) +
  xlab("Scraped Index of Products") +
  ylab("Percentage of Vendor Type")


## Aggregate Table

get_ratio_of_vendor <- function(scraped_index, vendor) {
  if (vendor == "Amazon") {
    nrow(amazon_data %>%
      filter(BBVendorType == "Amazon") %>%
      filter(ScrapedIndex == scraped_index)) / 250
  }
  else if (vendor == "FBA") {
    nrow(amazon_data %>%
      filter(BBVendorType == "FBA") %>%
      filter(ScrapedIndex == scraped_index)) / 250
  } else {
    nrow(amazon_data %>%
      filter(BBVendorType == "O") %>%
      filter(ScrapedIndex == scraped_index)) / 250
  }
}

vendor_ratios_for_index <- function(index) {
  return(amazon_data %>%
    filter(ScrapedIndex == index) %>%
    group_by(BBVendorType) %>%
    summarize(ratio = get_ratio_of_vendor(index, BBVendorType)) %>%
    mutate(ScrapedIndex = index) %>%
    select(ScrapedIndex, BBVendorType, ratio))
}

ratios_for_all_products <- function(aggr_table) {
  while (i <= 250) {
    if (nrow(amazon_data %>% filter(ScrapedIndex == i)) != 0) {
      aggr_table <- union(aggr_table, vendor_ratios_for_index(i))
    }
    i <- i + 1
  }
  return(aggr_table)
}

aggregate_table_tmp <- vendor_ratios_for_index(1)
i <- 2

# for each of the scraped indexes across 162 categories, what ratio is sold
# by each vendor type.
aggregate_table <- ratios_for_all_products(aggregate_table_tmp)
aggregate_table$BBVendorType[aggregate_table$BBVendorType == "Amazon"] <-
  "Sold and Fulfilled by Amazon"
aggregate_table$BBVendorType[aggregate_table$BBVendorType == "FBA"] <-
  "Fulfilled by Amazon"
aggregate_table$BBVendorType[aggregate_table$BBVendorType == "O"] <-
  "Not sold or Fulfilled by Amazon"


## Summary Information

# Load dataset from Github
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
