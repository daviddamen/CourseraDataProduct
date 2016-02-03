library(shiny)

shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Compare yourself to the average woman of 1975"),
  
  # Sidebar with controls to input your height and weight
  sidebarPanel(
    numericInput('height', 'Your height (cm):', 
                 170, min=50, max=250, step=1),
    numericInput('weight', 'Your weight (kg):', 
                 75, min=30, max=250, step=1),
    submitButton('Submit', icon('refresh'))
  ),
  
  # Show the caption and plot of the requested variable against mpg
  mainPanel(
    p('Enter your height and weight on the left, and see how you compare to average women of 1975.'),
    h3('Comparison results'),

    plotOutput("whPlot")
  )
))