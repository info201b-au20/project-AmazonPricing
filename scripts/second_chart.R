# Amazon product pricing

# How likely BBCorrectedPrice is (not) the lower price, based on different vendor type

# Faceted histogram:
# three categories by vendor type : Amazon, FBA, Other. (“ScrapedIndexVendortype”)
# showing the distribution of “CorrectedPrice” / ”BBCorrectedPrice” log ratio of all vendor listings.


# Load the tidyverse package
library("tidyverse")

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


