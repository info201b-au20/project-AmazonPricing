# Libraries
library(plotly)
library(shiny)
library(stringr)
library(shinythemes)
source("app_server.R")

############################ START INTRO PANEL ##############################
intro_main <- fluidPage( #mainPanel(
  #ouput$image <- renderUI({
  tags$img(src='amazon.png', height=414, width=432),
  h1("Introduction"),
  p("The purpose of this project is to analyze Amazon's anti-competitive practices
    and pricing. Considering Amazon's powerful presence in the e-commerce industry, 
    we found that analyzing this data would help us gain insight into the company's
    successes. The three datasets that we have collected include extensive information 
    about various products on Amazon, product pricing, vendor information, and 
    insight into the ranking system that's implemented through Amazon's software."),
  h3("Major Questions"),
  p("Since the start of our research in this domain, we formulated 5 questions which 
    we have answered through our analysis. In answering these questions, we utilized 
    the Amazon Product Pricing dataset accessed through the", a("ProPublica Data Store.", 
    href = "https://www.propublica.org/datastore/dataset/amazon-pricing-algorithm-data-set"),
    "This dataset helped us gauge a well-rounded understanding of the products on Amazon's
    interface and how various vendors play into the selling of identical products. The first 
    question we cover is *How does Amazon's pricing algorithm help customers, third party
    sellers and Amazon itself?* The second question we have successfully answered through 
    our analysis is, *What percentage of products on Amazon are sold by third-party sellers
    versus Amazon?* Our third and final posed question answered by our report is, *Does 
    Amazon rank their own products above similarly priced products sold by third party 
    vendors?* or *Does Amazon price their products lower than similar products sold by 
    third party vendors?* These questions helped guide us through our analysis of the
    Amazon Product Pricing Dataset, giving us insight into what the relationship
    between products and various vendors on Amazon really is."),
  p("Throughout this report, you will be able to navigate various elements allowing
    you to understand the dataset under different conditions.")
)

introduction_panel <- tabPanel(
  "Introduction",
  intro_main,
)
############################# END INTRO PANEL ###############################

############################ START FIRST CHART ##############################
prices_sidebar_content <- sidebarPanel(
  titlePanel("Filter"),
  selectInput(
    inputId = "product_name",
    label = "Select a Product",
    choices = product
  ),
  radioButtons(
    inputId = "color_input",
    label = "Select a Color",
    choices = c("Purple", "Magenta")
  )
)
prices_main_content <- mainPanel(
  plotlyOutput("price_chart"),
  p("This interactive chart demonstrates the price variation given a particular
    product. For each of the 250 products in the database, this chart displays
    all of the prices and vendors for a chosen product. To clarify, this chart
    does not filter or take into consideration the different fullfilment types.
    From this chart, we can conlude that it is important to look at the 
    different vendors for each product to ensure that you are not overpaying.")
)
first_chart_panel <- tabPanel(
  "Price Variation",
  titlePanel("Price Variation Per Product"),
  sidebarLayout(
    prices_sidebar_content,
    prices_main_content)
)
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
  theme = shinytheme("united"),
  "Amazon Pricing",
  introduction_panel,
   first_chart_panel, 
  # second_chart_panel, 
  third_chart_panel,
  summary_panel
)
