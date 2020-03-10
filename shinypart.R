

#這是shiny的部分 可以由insurave policy檔案中的npvplot得到data.frame

library(plotly)
library(shiny)
library(ggplot2)
ui <- fluidPage(
  titlePanel(title=h4("簡易儲蓄險NPV計算()", align="center")),
  actionButton("go", "Go"),
  numericInput("yearpay", "一年要繳多少錢(萬)", 10),
  numericInput("year", "要繳幾年", 20),
  numericInput("yearget", "期滿後一年可得的報酬(萬)", 12),
  numericInput("restyear", "期滿後預期可活幾年", 40),
  numericInput("rate", "你認為的通貨膨脹率", 0.02),
  plotOutput("plot")
)

server <- function(input, output) {
  
  npvplot <- function(yearpay,yearget,rate,year,restyear){

    npv<-function(yearpay,yearget,rate,year,restyear){
      
      benefit<- sum( yearget/  ( (1+rate)^seq(year-1, year+restyear-1)  ) )
      cost <- sum  (   yearpay/  ( (1+rate)^seq(0, year-1              )  ) )         
      return( benefit-cost   )
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
    
    npvplot(input$yearpay,input$year,input$yearget,input$restyear,input$rate)
  })
  
  output$plot <- renderPlot({
    ggplot(value(),aes(x=restlife,y=benefit))+geom_line()
  })
}

shinyApp(ui, server)

