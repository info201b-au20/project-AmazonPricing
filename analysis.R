library(tidyverse)

# Load the data from GitHub

amazon_data <- read.csv(
  paste("https://raw.githubusercontent.com/info201b-au20/project-",
        "AmazonPricing/gh-pages/data/Amazon-Ranking-Analysis.csv?token=",
        "AKQ3B6Q3UEQDBPM4IBQS3B27W2R5W",
        sep = ""
  )
)

## First Chart

# Check the number of total unique products is 250
check <- amazon_data %>%
  group_by(ProductName) %>%
  count(unique(ProductName))

# We will be examining the top 5 unique products which means the top 272 Indexes
top_5_products <- amazon_data %>%
  filter(Index <= 44)

# Create a dot plot that shows the variation of cost within the top 5 Products

ggplot(top_5_products, aes(ScrapedIndexPrice, ProductName)) +
  geom_point(aes(color = ScrapedIndexVendor)) +
  scale_x_continuous(breaks = seq(0, 75, 5)) + 
  labs(color = "Vendor") +
  xlab("Scraped Index Price") +
  ylab("Product Name") 


## Second Chart

# Load Amazon 250 best selling products data from data downloaded in Github
amazon_data <- read.csv(
  paste("https://raw.githubusercontent.com/info201b-au20/project-",
        "AmazonPricing/gh-pages/data/Amazon-Ranking-Analysis.csv?token=",
        "AKQ3B6Q3UEQDBPM4IBQS3B27W2R5W",
        sep = ""
  )
)

# calculate the log ratio of corrected price to Buy Box corrected price
corrected_price_to_BBs_ratios <- amazon_data %>%
mutate(CorrectedToBBCorrectedRatio = amazon_data$CorrectedPrice / amazon_data$BBCorrectedPrice) %>%
  select(Index, CorrectedPrice, BBCorrectedPrice, CorrectedToBBCorrectedRatio, ScrapedIndexVendorType, BBVendorType)

# create the Faceted histogram
ggplot(data = corrected_price_to_BBs_ratios) +
  geom_point(mapping = aes(x = Index , y = CorrectedToBBCorrectedRatio)) +
  facet_wrap(~ScrapedIndexVendorType) +
  ggtitle(paste("Distribution of Price ratio of All Vendor Listings",
                sep = ""
  )) +
  xlab("Scraped Index of Products") +
  ylab("Ratio")

# todo: color dots : == 1 / >1 / <1 

# Simple Summary:
# the chart suggests that most of BB product price is the same as amazon's own product's.
# so BB product is more likely to be amazon's product?
# FBA's price is trying to align with BBprice. or above.
# but looking at other vendors', they would have many prices that's lower than BBprice.

mutate(PriceLogRatio = log(amazon_data$CorrectedPrice / amazon_data$BBCorrectedPrice)) %>%
select(Index, CorrectedPrice, BBCorrectedPrice, PriceLogRatio, ScrapedIndexVendorType, BBVendorType)

# create the Faceted histogram 
# x-axis is log ratio of corrected price to Buy Box corrected price
# y-axis is the count of listings 
# highlighted the Buy Box corrected price
ggplot(data = corrected_price_to_BBs_ratios, aes(x = PriceLogRatio)) +
  geom_histogram(binwidth = 0.1, aes(fill = (PriceLogRatio >= -0.05 & PriceLogRatio <= 0.05))) +
  #scale_fill_manual(values = c(`TRUE` = "magenta4", `FALSE` = alpha("grey", 0.7))) +
  facet_wrap(~ScrapedIndexVendorType, scales = "free_y")


## Third Chart

# create a dataset
# Load data from GitHub
source("aggregate_table.R")

top_20_index_ratios <- aggregate_table %>%
  filter(ScrapedIndex <= 20)

ggplot(top_20_index_ratios, aes(fill = BBVendorType, y = ratio,
                                x = ScrapedIndex)) +
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
