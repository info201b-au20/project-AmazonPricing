# Build Scatter file: function that returns a plotly Scatter plot
library(plotly)
library(stringr)
library(tidyr)

library("tidyverse")

### Build Pie ###
build_pie <- function(data, indices) {
  
  
  
  get_ratio_of_vendor <- function(start_index, start_stop, vendor) {
    total <- nrow(data %>%
                    filter(ScrapedIndex >= start_index) %>%
                    filter(ScrapedIndex <= start_stop))
    
    nrow(data %>%
           filter(BBVendorType == vendor) %>%
           filter(ScrapedIndex >= start_index) %>%
           filter(ScrapedIndex <= start_stop)) / total
  }
  
  ratios_for_indices <- function(start_index, stop_index) {
    vendor_types <- unique(data %>% pull(BBVendorType))
    vendor_ratios_table <- data.frame(VendorType=character(),
                                      Ratio=double(), 
                                      stringsAsFactors=FALSE) 
    
    for (vendor in vendor_types) {
      vendor_ratio <- get_ratio_of_vendor(start_index, stop_index, vendor)
      vendor_ratios_table <- vendor_ratios_table %>% add_row(VendorType = vendor, Ratio = vendor_ratio)
      
    }
    return(vendor_ratios_table)
  }
  
  # for each of the scraped indexes across 162 categories, what ratio is sold
  # by each vendor type.
  aggregate_table <- ratios_for_indices(start_index = indices[1], stop_index = indices[2])
  aggregate_table$VendorType[aggregate_table$VendorType == "Amazon"] <-
    "Sold and Fulfilled by Amazon"
  aggregate_table$VendorType[aggregate_table$VendorType == "FBA"] <-
    "Fulfilled by Amazon"
  aggregate_table$VendorType[aggregate_table$VendorType == "O"] <-
    "Not sold or Fulfilled by Amazon"
  
  
  # Plot data
  print(aggregate_table)
  p <- plot_ly(
    aggregate_table,
    type = "pie",
    labels = ~VendorType,
    values = ~Ratio, 
    textposition = 'inside',
    textinfo = 'percent',
    insidetextfont = list(color = '#FFFFFF'),
    hoverinfo = 'text', 
    text = ~paste(VendorType)
  ) 


  return(p)
}
