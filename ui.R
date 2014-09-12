library(shiny)

# Define UI for our assignment
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("My Demo"),
  
  #define the sidebar navigation panel
  #the user will be able to select an option for which the application will display (on the main panel) either the histogram or the summary of the data 
  sidebarPanel(
    selectInput("myVariable", "Please select:",
                list("MPG" = "mpg",                   
                     "Cylinders" = "cyl", 
                     "Displacement" = "disp",                   
                     "Transmission" = "am",                   
                     "Horse Power" = "hp",
                     "Rear Axle Ratio" = "drat",
                     "Gears" = "gear",
                     "Carburetors" = "carb"))
  ),
  
 
  #define where the user interation will display the results
  mainPanel(
    tabsetPanel(
      tabPanel("Histogram", plotOutput("myHistograms")), 
      tabPanel("Summary", verbatimTextOutput("mySummary"))
    )
  )
))