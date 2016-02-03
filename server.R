library(shiny)
library(datasets)

# We convert the raw data to the metric system.
# (inch -> meter, lb -> kg).
womenDF <- women
womenDF$height <- womenDF$height * 2.54
womenDF$weight <- womenDF$weight * 0.453592

# Define server logic required to plot various variables against mpg
shinyServer(function(input, output) {
  
  # Compute the forumla text in a reactive expression since it is 
  # shared by the output$caption and output$mpgPlot expressions
  addToWomenDF <- reactive({
    df <- womenDF
    df[length(womenDF[,1])+1,] <- list(input$height, input$weight)
    df
  })
  
  output$height <- reactive({input$height})
  output$weight <- reactive({input$weight})
  output$whPlot <- renderPlot({
    df <- addToWomenDF()
    plot(df$height, df$weight,
         xlab='Height', ylab='Weight',      
         xlim=c(0, max(df$height) + 10),
         ylim=c(0, max(df$weight) + 5),
         col=ifelse(df$weight==input$weight & df$height==input$height, "blue", "black"),
         pch=ifelse(df$weight==input$weight & df$height==input$height, 19, 1), 
         cex=ifelse(df$weight==input$weight & df$height==input$height, 2, 1))
  })
})