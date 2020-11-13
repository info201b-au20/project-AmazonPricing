# How likely BBCorrectedPrice is (not) the lower price, based on different vendor type?
# Faceted histogram:
# three categories by vendor type : Amazon, FBA, Other. (“ScrapedIndexVendortype”)
# showing the distribution of “CorrectedPrice” / ”BBCorrectedPrice” ratio of all vendor listings.
# If “CorrectedPrice”/”BBCorrectedPrice” Ratio < 1, BBCorrectedPrice is not the lower price in the listing.

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

# calculate the ratio of corrected price to Buy Box corrected price
corrected_price_to_BBs_ratios <- amazon_data %>%
  mutate(CorrectedToBBCorrectedRatio = log(amazon_data$CorrectedPrice / amazon_data$BBCorrectedPrice)) %>%
  select(Index, CorrectedPrice, BBCorrectedPrice, CorrectedToBBCorrectedRatio, ScrapedIndexVendorType, BBVendorType)





# create the Faceted histogram
ggplot(data = corrected_price_to_BBs_ratios, aes(x = CorrectedToBBCorrectedRatio)) +
  geom_histogram(binwidth = 0.1) +
  facet_wrap(~ScrapedIndexVendorType, scales = "free_y") 


