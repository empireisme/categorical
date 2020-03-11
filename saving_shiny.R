#rm(list = ls())

require(shiny)
require(plotly)
library(ggplot2)

ui <- fluidPage(
  titlePanel(title=h4("Savings insurance(by ning_kuan)", align="center")),
  actionButton("go", "Go"),
  numericInput("yearpay", "
How much to pay for a year (ten thousand)", 10),
  numericInput("year", "How many years you need to pay", 20),
  numericInput("yearget", "How much money you can get in a year after the expiration(ten thousand)", 12),
  numericInput("restyear", "The restlife you think you have after the expiration", 40),
  numericInput("rate", "Inflation rate(the average inflation rate in 20 years is 1.26%)", 0.0126),
  plotOutput("plot")
)

server <- function(input, output) {
  npvplot <- function(yearpay,yearget,rate,year,restyear){
    
    npv<-function(yearpay,yearget,rate,year,restyear){
      
      benefit<- sum(yearget/((1+rate)^seq(year-1, year+restyear-1)))
      cost <- sum  (yearpay/((1+rate)^seq(0, year-1)))         
      return(benefit-cost)
    }
    
    benefit <- vector("numeric",length = 50)
    
    for(i in 1:50){
      
      benefit[i]<- npv(yearpay,yearget,rate,year,i) 
      
    }
    
    restlife <- c(1:50)
    dat <- data.frame(restlife,benefit)
    return(dat )
    #qplot(restlife,benefit,geom = "line")
  }
  value<- eventReactive(input$go, {
    npvplot(input$yearpay,input$yearget,input$rate,input$year,input$restyear)
  })
  output$plot <- renderPlot({
    ggplot(value(),aes(x=restlife,y=benefit))+geom_line()+labs(x = 'years you still be alive after the expiration',
                                                               y = 'Npv (ten thousand)',
                                                               title = 'The npv curve')
  })
}

shinyApp(ui, server)


