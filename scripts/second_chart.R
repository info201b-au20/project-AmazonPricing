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