# server.R
library(dplyr)
library(shiny)
library(plotly)


# Read in data
amazon_data <- read.csv("./data/Amazon-Ranking-Analysis.csv", stringsAsFactors = FALSE)


# Start shinyServer
# server <- function(input, output) {
#   # Render a plotly object that returns your scatter plot
#   
# }
