library("tidyverse")
library("ggplot2")
# library

# create a dataset
# Load data from GitHub
source("aggregate_table.R")

top_20_index_ratios <- aggregate_table %>%
  filter(ScrapedIndex <= 20)

ggplot(top_20_index_ratios, aes(
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
