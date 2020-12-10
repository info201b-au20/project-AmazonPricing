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
    labs(y = "count of listings ", x = "distribution") + 
    geom_histogram(binwidth = 0.1, aes(fill = (PriceLogRatio >= -0.05 & PriceLogRatio <= 0.05))) +
    guides(fill = guide_legend(title="BuyBox")) +
    #scale_fill_manual(values = c(`TRUE` = "magenta4", `FALSE` = alpha("grey", 0.7))) +
    facet_wrap(~ScrapedIndexVendorType, scales = "free_y") 
  return(second_chart_local)
}


prices_sidebar_content_pyt <- sidebarPanel(
  sliderInput("price_range_slider", label = h3("Price Range"), min = min_price_range, 
              max = max_price_range, value = c(40, 900))
)
prices_main_content_pyt <- mainPanel(
  plotlyOutput("second_chart"),
  p("Some text.")
)
second_chart_panel <- tabPanel(
  "Compare with Buy Box Price",
  titlePanel("Compare with Buy Box Price by Vendor type"),
  sidebarLayout(
    prices_sidebar_content_pyt,
    prices_main_content_pyt)
)