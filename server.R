library(shiny)
library(ggplot2)

# Uses the presidentData dataset which the author created by combining 3 datasets downloaded from
#www.data.gov and minimally processing them.  The datasets are a listing of all executive orders 
#issued by each of the last 3 presidents (Clinton, Bush & Obama).  The original datasets can be 
#downloaded from:

#1. Bush: http://catalog.data.gov/dataset/executive-orders-george-w-bush
#2. Clinton: http://catalog.data.gov/dataset/executive-orders-william-j-clinton
#3. Obama: http://catalog.data.gov/dataset/executive-orders-barack-obama

#setwd("~/Desktop/DevelopingDataProducts/ExecOrders")

#Loads dataset and seperates out the 3 dataframes
presidentData = read.csv(file="PresidentialExecutiveOrders.csv", header = TRUE)
obama <- subset(presidentData, presidentData$president=="Obama")
clinton <- subset(presidentData, presidentData$president=="Clinton")
bush <- subset(presidentData, presidentData$president=="Bush")



# Define a server for the Shiny app
shinyServer(function(input, output) {
       
        
        # Create the right histogram
        output$orderPlot <- renderPlot({
                # Render a barplot
                if(input$president == "obama")   hist(obama$year,
                                                      breaks = c(2008,2009,2010,2011,2012,2013,2014,2015),
                                                      col = "blue",
                                                      ylab = "Quantity",
                                                      xlab = "Year",
                                                      main = "Number or Orders Signed")
                
                if(input$president == "clinton")   hist(clinton$year,
                                                      col = "blue",
                                                      ylab = "Quantity",
                                                      xlab = "Year",
                                                      main = "Number or Orders Signed")
                
                if(input$president == "bush")   hist(bush$year,
                                                     breaks = c(2001,2002,2003,2004,2005,2006,2007,2008,2009),
                                                      col = "red",
                                                      ylab = "Quantity",
                                                      xlab = "Year",
                                                      main = "Number or Orders Signed")
                
                if(input$president == "presidentData")   hist(presidentData$year,
                                                     col = "red",
                                                     ylab = "Quantity",
                                                     xlab = "Year",
                                                     main = "Number or Orders Signed")
        })
})