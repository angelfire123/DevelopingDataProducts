library(shiny)
library(datasets)

# we will use the mtcars as default data because it's common to the R environment
mpgData <- mtcars

#default value for the myTitle; this variable will store the generated title based on input selection
myTitle <- 'Nothing'


shinyServer(function(input, output) {

#based on input selection, the application will have to generate labels as titles of the results      
  generateLabel <- reactive({
    myTitle <- switch(input$myVariable,
                      mpg='MPG',                   
                      cyl='Cylinders', 
                      disp='Displacement',                   
                      am='Transmission',                   
                      hp='Horse Power',
                      drat='Rear Axle Ratio',
                      gear='Gears',
                      carb='Carburetors'
                      )
    
  })
  
#this function will render the histogram of the data required by user's input
  output$myHistograms <- renderPlot({
    hist(mpgData[,input$myVariable], main=paste("Histrogram of ", generateLabel()), xlab=generateLabel())
  })

#this function will render the summary of the data required by user's input
  output$mySummary <- renderPrint({
    summary(mpgData[,input$myVariable])
  })
  
})