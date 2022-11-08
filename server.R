
# This is the server logic of the Shiny web application. You can run the application by clicking 'Run App' above.


library(shiny)
library(datasets)
library(shinyhelper)

# Define server logic required to summarize and view the selected DataSet
shinyServer(function(input, output) {
  
  observe_helpers(help_dir = "helpfiles")
  
  # Return the requested dataset
  datasetInput <- reactive({
    switch(input$dataset,
           "rock" = rock,
           "pressure" = pressure,
           "cars" = cars)
  })
  
  # Generate a summary of the DataSet
  output$summary <- renderPrint({
    dataset <- datasetInput()
    summary(dataset)
  })
  
  # Show the first "n" observations
  output$view <- renderTable({
    head(datasetInput(), n = input$obs)
  })
  
  output$doc <- renderText({ 
    "Documentation: click help icons to see some documentation.\n"
  })
  
})
