# Libraries
library(plotly)
library(shiny)
library(stringr)
source("app_server.R")

########################## PIE CHART (third chart) ###########################
pie_sidebar_content <- 
  sliderInput("indices", "Indices to include",
              min = 1, max = 250, value = c(1, 250),
              width = '500px'
  )

pie_main_content <- mainPanel(
  plotlyOutput("pie"), 
  pie_sidebar_content,
  tags$p(
    paste(
      "The values that I calculated in the Summary tab found that",
      "in 2015, on average, people in the United States emitted",
      "about 3.5 times as much CO₂ as other people in the world. I",
      "wanted to investigate how the CO₂ Per Capita has increased overtime", 
      "in the United States. This vizualization not only lets you do that,",
      "but it also allows you to look at the annual CO₂ emmissions overtime.",
      "In addition, the vizualization lets you choose any country or the",
      "entire world. This can help us identify trends like how has the annual",
      "CO₂ emissions changed for different countries overtime, and how the",
      "CO₂ emissions per capita has changed for different countries overtime.",
      "I observed that for the United States, Annual CO₂ emissions started",
      "increasing at a faster rate around 1900, but since 2007 they actually",
      "have been decreasing. This might be because of the reduction in the",
      "use of coal for power generation in the United States. Another reason",
      "could be that in 2016, the United States became a signatory to the",
      "Paris Agreement, an agreement within the United Nations Framework",
      "Convention on Climate Change. The world's annual CO₂ emissions has",
      "been rapidly increasing since around 1950, but it hasn't really had",
      "any significant decreases that are visible.",
      sep = " "
    )
  )
)

third_chart_panel <- tabPanel(
  "Analyze by Vendor Type",
  # Add a titlePanel to your tab
  titlePanel("Percentage of each Vendor Type"),
  pie_main_content
)
####################### END OF PIE CHART (third chart) ########################


# Define a variable `ui` storing a `navbarPage()` element containing
# your the pages defined above
ui <- navbarPage(
  "Amazon Pricing",
  # summary_panel,
  # first_chart_panel, 
  # second_chart_panel, 
  third_chart_panel 
  # conclusion_panel
)
