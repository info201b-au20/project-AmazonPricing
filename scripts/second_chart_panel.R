#build the Faceted histogram
make_second_chart <- function(data, min_price = -99999999, max_price = 999999999)
{
  # calculate the log ratio of corrected price to Buy Box corrected price
  corrected_price_to_BBs_ratios_local <- data %>%
    mutate(PriceLogRatio = log(data$CorrectedPrice / data$BBCorrectedPrice)) %>%
    filter(data$CorrectedPrice >= min_price & data$CorrectedPrice <= max_price) %>%
    select(Index, CorrectedPrice, BBCorrectedPrice, PriceLogRatio, ScrapedIndexVendorType, BBVendorType)
  
  # create the Faceted histogram 
  # x-axis is log ratio of corrected price to Buy Box corrected price
  # y-axis is the count of listings 
  # highlighted the Buy Box corrected price
  second_chart_local <- ggplot(data = corrected_price_to_BBs_ratios_local, aes(x = PriceLogRatio)) +
    labs(title = ("Comparing Buy Box Pirce with All listings from Amazon 250 Best Selling Products Data"),
         y = "Count of Listings ", x = "Distribution") + 
    #theme(title = element_text(color = alpha("blue", 0.5), face = "bold")) +
    geom_histogram(binwidth = 0.1, aes(fill = (PriceLogRatio >= -0.05 & PriceLogRatio <= 0.05))) +
    guides(fill = guide_legend(title="Buy Box")) +
    #scale_fill_manual(values = c(`TRUE` = "magenta4", `FALSE` = alpha("grey", 0.7))) +
    facet_wrap(~ScrapedIndexVendorType, scales = "free_y") 
  return(second_chart_local)
}


prices_sidebar_content_pyt <- sliderInput(
  width = ("80%"),
  "price_range_slider", label = h3("Price Range"), min = min_price_range, 
              max = max_price_range, value = c(40, 900),
)

prices_main_content_pyt <- mainPanel(
  width = ("80%"),
  plotlyOutput("second_chart"),
  prices_sidebar_content_pyt,
  p(" "),
  p("This faceted histogram show the ",
    strong("distribution of each vendor type"), 
    "for 250 best selling products' all price listings from the dataset"),
  p(strong("Buy Box"), "Price listings is highlighted in cyan.", 
    span(em("Buy box"),
    em("product is the one pops up first as a suggested purchase on Amazon's ",  
    "virtual shelves among all sellers for this product."),
    style = "color:#33cccc") ),
  p("In general, in each histogram, listing counts to the", strong("left"), 
    "of the", em("Buy Box"), "bar are the ", strong("cheaper"),
    "options and to the", strong("right"), "of the",
    em("Buy Box"), "bar are more", strong("expansive.")),
  p("-------------------------------------------------------------------------"),
  h4("Three different vendor types are:", style = "color:#595959"),
  p(strong("Amazon"), em("(sold and fulfilled by amazon)")),
  p(strong("FBA"), em("(only Fulfilled By Amazon)")),
  p(strong("Other"), em("(neither sold nor fulfilled by amazon).")),
  p("To clarify, only fulfilled",
    "by amazon means the product is sold by a third party seller then",
    "shipped by amazon. For each of the 250 products, there are multiple",
    "sellers.")
)

second_chart_panel <- tabPanel(
  "Compare with Buy Box Price",
  titlePanel("Distribution of Price Listings by Vendor type"),
  prices_main_content_pyt
)