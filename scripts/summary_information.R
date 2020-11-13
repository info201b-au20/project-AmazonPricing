library(tidyverse)

#Load dataset from Github
amazon_data <- read.csv(
  paste("https://raw.githubusercontent.com/info201b-au20/project-",
        "AmazonPricing/gh-pages/data/Amazon-Ranking-Analysis.csv?token=",
        "AKQ3B6Q3UEQDBPM4IBQS3B27W2R5W",
        sep = ""
  )
)
summary_info <- list()
summary_info$num_observations <- nrow(amazon_data)

summary_info$max_cost_difference <-amazon_data %>% 
 mutate(discrepancy = CorrectedPrice - ScrapedIndexPrice) %>% 
  filter(discrepancy == max(discrepancy, na.rm = T)) %>% 
  pull(discrepancy)

summary_info$
#Knowing that there are multiple vendors for each product(multiple entires for
#each product), how many vendors of each unique product use "Filled by Amazon"
#FBA?
fab_product_count <- amazon_data %>% 
  group_by(ProductName) %>% 
  filter(ScrapedIndexVendorType == "FBA") %>% 
  count(ProductName)
  #Sub-question: How many vendors vs the total number of vendors for each unique
  #product use "Filled by Amazon" (FBA)?
    total_vendors_per_product <- amazon_data %>% 
      group_by(ProductName) %>% 
      count(ProductName)
    fba_vendors_vs_all_vendors <- total_vendors_per_product$n - fab_product_count$n
  #* there are negative numbers in some of these entries because some products 
  #* #do not use FBA at all

#Which products have a different price listed than when it is added to the cart?
  #List the product, and the amount difference
price_discrepancy <- 

#