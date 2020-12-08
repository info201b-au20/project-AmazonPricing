# Libraries
library(plotly)
library(shiny)
library(stringr)
source("app_server.R")

############################ START INTRO PANEL ##############################
############################# END INTRO PANEL ###############################

############################ START FIRST CHART ##############################
############################# END FIRST CHART ###############################

############################ START SECOND CHART ##############################
############################# END SECOND CHART ###############################

############################ START THIRD CHART ##############################
pie_sidebar_content <- 
  sliderInput("indices", "Indices to include",
              min = 1, max = 162, value = c(1, 162),
              width = '500px'
  )

pie_main_content <- mainPanel(
  plotlyOutput("pie"), 
  pie_sidebar_content
)

third_chart_panel <- tabPanel(
  "Analyze by Vendor Type",
  # Add a titlePanel to your tab
  titlePanel("Percentage of each Vendor Type"),
  pie_main_content
)
############################# END THIRD CHART ###############################

############################ START SUMMARY PANEL ##############################
summary_main_content <- mainPanel(
  tags$p(
    paste(
      "This is just random text now but we should fill it in with",
      "observations from the three charts above (one from each).",
      sep = " "
    )
  )
)

summary_panel <- tabPanel(
  "Summary Takeaways",
  # Add a titlePanel to your tab
  titlePanel("Takeaways from our Analysis"),
  summary_main_content
)

############################# END SUMMARY PANEL ###############################




# Define a variable `ui` storing a `navbarPage()` element containing
# your the pages defined above
ui <- navbarPage(
  "Amazon Pricing",
  # introduction_panel,
  # first_chart_panel, 
  # second_chart_panel, 
  third_chart_panel,
  summary_panel
)
