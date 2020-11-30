library(tidyverse)

# Load the data from GitHub

amazon_data <- read.csv("https://raw.githubusercontent.com/info201b-au20/project-AmazonPricing/gh-pages/data/Amazon-Ranking-Analysis.csv?token=ARIOKKKAAFIU5IRJ5ZKCJT27ZW5S2")
# Check the number of total unique products is 250
check <- amazon_data %>%
  group_by(ProductName) %>%
  count(unique(ProductName))

# We will be examining the top 3 unique products which means the top 20 Indexes
top_3_products <- amazon_data %>%
  filter(Index <= 20) %>% mutate(ProductName = strtrim(ProductName,30))

# Create a dot plot that shows the variation of cost within the top 3 Products

first_chart<- ggplot(top_3_products, aes(ScrapedIndexPrice, ProductName)) +
  geom_point(aes(color = ScrapedIndexVendor)) +
  scale_x_continuous(breaks = seq(0, 75, 5)) + 
  labs(color = "Vendor") +
  xlab("Scraped Index Price") +
  ylab("Product Name") 
