library(shiny)
library(ggplot2)

# Uses the presidentData dataset which the author created by combining 3 datasets downloaded from
#www.data.gov and minimally processing them.  The datasets are a listing of all executive orders 
#issued by each of the last 3 presidents (Clinton, Bush & Obama).  The original datasets can be 
#downloaded from:

#1. Bush: http://catalog.data.gov/dataset/executive-orders-george-w-bush
#2. Clinton: http://catalog.data.gov/dataset/executive-orders-william-j-clinton
#3. Obama: http://catalog.data.gov/dataset/executive-orders-barack-obama


# Interface Definition
shinyUI(
        
        # Use a fluid Bootstrap layout
        fluidPage(    
                
                # Page Title
                titlePanel("Executive Orders"),
                
                presidentNames <<- list("Barack Obama" = "obama",
                                        "George W. Bush" = "bush",
                                        "Bill Clinton" = "clinton",
                                        "All 3" = "presidentData"),
                
                # Sidebar
                sidebarLayout(      
                        
                        # get Input
                        sidebarPanel(
                                selectInput("president", "President:", 
                                            choices= presidentNames),
                                hr(),
                                helpText("Data downloaded from Data.gov website. Select one of the presidents
                                         from the list or the 'All 3' option to see how many executive
                                         orders each signed per year during their presidency.")
                        ),
                        
                        # Display Plot
                        mainPanel(
                                plotOutput(outputId = "orderPlot") 
                        )
                        
                )
        )
)