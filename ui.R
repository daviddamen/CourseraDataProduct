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
    p('The R datasets package contains a dataset on average heights and weights for woman aged 30 to 39.'),
    p('This app allows to visualize how you would stack up against the average female build of 1975.'),
    p('By using the inputs on the right, you can enter your height (in cm) and weight (in kg). Below, a graph will be shown
      that shows the average heights and weights of the women in small circles. Your height and weight will be shown as a
      blue dot.'),
    a(href='https://github.com/daviddamen/CourseraDataProduct', "R code on github"),
    h3('Comparison results'),

    plotOutput("whPlot")
  )
))