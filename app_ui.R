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
              width = '100%'
  )

pie_main_content <- mainPanel(
  plotlyOutput("pie"),
  pie_sidebar_content,
  tags$p(paste(
    "This pie chart shows the percentage of each vendor type for the 250",
         "Amazon products in the data set. The different vendor types are",
         "sold and fulfilled by amazon, only fulfilled by amazon, and",
         "neither sold nor fulfilled by amazon. To clarify, only fulfilled",
         "by amazon means the product is sold by a third party seller then",
         "shipped by amazon. For each of the 250 products, there are multiple",
         "sellers. The dataset records the order that Amazon ranks the same",
         "product sold by different sellers with an index. The slider below",
         "the pie chart allows you to see the percentage of each vendor type",
         "for different index ranges.", sep = " ")
  )
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
