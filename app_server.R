# server.R
library(dplyr)
library(shiny)
library(plotly)


# Read in data
amazon_data <- read.csv("./data/Amazon-Ranking-Analysis.csv", stringsAsFactors = FALSE)

product <- unique(amazon_data$ProductName)
max_price_range <- max(amazon_data$CorrectedPrice)
min_price_range <- min(amazon_data$CorrectedPrice)

source("./scripts/build_pie.R")
source("./scripts/second_chart.R")

# Start shinyServer
server <- function(input, output) {
  # Render a plotly object that returns your scatter plot
  output$pie <- renderPlotly({
    return(build_pie(amazon_data, input$indices))
  })
  output$price_chart <- renderPlotly({
    plot <- ggplot(data = amazon_data %>% filter(ProductName == input$product_name)) +
      geom_point(mapping = aes(x = ScrapedIndexPrice, y = ScrapedIndexVendor),
                 color = input$color_input) + xlab("Price ($)") + ylab("Vendor")
    
    ggplotly(plot)
  })
  output$second_chart <- renderPlotly({
    return(ggplotly(make_second_chart(
      amazon_data,
      input$price_range_slider[1],
      input$price_range_slider[2])))
  })
}