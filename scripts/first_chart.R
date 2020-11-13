library(tidyverse)

# Load the data from GitHub

amazon_data <- read.csv(
  paste("https://raw.githubusercontent.com/info201b-au20/project-",
    "AmazonPricing/gh-pages/data/Amazon-Ranking-Analysis.csv?token=",
    "AKQ3B6Q3UEQDBPM4IBQS3B27W2R5W",
    sep = ""
  )
)

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
