# server.R
library(dplyr)
library(shiny)
library(plotly)


# Read in data
amazon_data <- read.csv("./data/Amazon-Ranking-Analysis.csv", stringsAsFactors = FALSE)

source("./scripts/build_pie.R")

# Start shinyServer
server <- function(input, output) {
  # Render a plotly object that returns your scatter plot
  output$pie <- renderPlotly({
    return(build_pie(amazon_data, input$indices))
  })
}