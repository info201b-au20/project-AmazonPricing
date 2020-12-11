library("tidyverse")

# Load data from GitHub
amazon_data <- amazon_data <- read.csv("https://raw.githubusercontent.com/info201b-au20/project-AmazonPricing/gh-pages/data/Amazon-Ranking-Analysis.csv?token=ARIOKKKUVW5AWQDWHRFCD427ZXB26")


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
