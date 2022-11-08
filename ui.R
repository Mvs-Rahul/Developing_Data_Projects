
# This is the user interface code of the Shiny web application. You can run the application by clicking 'Run App' above.

library(shiny)
library(shinyhelper)
library(dplyr)

# Define UI for dataset viewer application
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Dataset Explorer"),
  
  
  # Sidebar with controls to select a dataset and specify the number
  # of observations to view
  sidebarPanel(
    
    textOutput("doc"),
    
    selectInput("dataset", "Choose a dataset:", 
                choices = c("rock", "pressure", "cars")) %>% helper(type = "inline",
                                                                    title = "Select the dataset",
                                                                    content = c("This is a <b>input box</b>.",
                                                                                "You can use this input to select the desired dataset.")),
    
    numericInput("obs", "Number of observations to view:", 10) %>% helper(type = "inline",
                                                                          title = "Choose number of observations",
                                                                          content = c("This is a <b>numeric input box</b>.",
                                                                                      "You can specify the number of observations."))
  ),
  
  # Show a summary of the dataset and an HTML table with the requested
  # number of observations
  mainPanel(
    verbatimTextOutput("summary") %>% helper(type = "inline",
                                             title = "Dataset Summary",
                                             content = c("This is a <b>summary</b>.",
                                                         "This summary shows some information like mean and median.")),
    
    tableOutput("view") %>% helper(type = "inline",
                                   title = "Table with some variables",
                                   content = c("This is a <b>table</b>.",
                                               "This table shows the dataset content."))
  )
  
))
