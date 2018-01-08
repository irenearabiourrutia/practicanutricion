library(shiny)
library(DT)

FoodFacts<-read.csv("/Users/irenearabiourrutia/Desktop/FoodFacts.csv",header=TRUE,sep=",")
sportsdef<-read.csv("/Users/irenearabiourrutia/Desktop/sportsdef.csv",header=TRUE,sep=";")
shinyServer(function(input, output,session) {
  
  misDatos<-reactiveValues()
  
  Data<-observe({
    ingredient<-isolate(input$ingrediente)
    row<-as.numeric(which(FoodFacts$product_name==ingredient))
    Calories100<-as.numeric(FoodFacts[row,9])
    g<-isolate(as.numeric(input$gramos))
    Calories<-(g*Calories100)/100
    i<-isolate(as.numeric(input$intake))
    colnames(sportsdef)<-c("SPORT","CALORIES BURNT IN 15 MIN","CALORIES BURNT IN 60 MIN")
    misDatos$muestra3<-sample(sportsdef$`SPORT`,1)
    Names<-c("GRAMS","INGREDIENT","CALORIES")
    dim(Names)<-c(1,3)
    Line0<-isolate(c(input$gramos,input$ingrediente,Calories))
    dim(Line0)<-c(1,3)
    table1<-rbind(Names,Line0)
    
    if (input$addboton > 1){
      
      newLine<-isolate(c(input$gramos,input$ingrediente,Calories))
      table2<-data.frame(isolate(misDatos$muestra1<-rbind(misDatos$muestra1,newLine)))
      totalcalories<-(sum(as.numeric(table2$CALORIES)))
      misDatos$muestra2<-(totalcalories*100)/i
    
    }else{
      colnames(table1)<-Names
      misDatos$muestra1<-table1[-1,]
      totalcalories<-Calories
      misDatos$muestra2<-(totalcalories*100)/i
    }
    
  })
  
  observeEvent(input$addboton,{
    output$table<-renderTable(rbind({misDatos$muestra1}))
    output$cal<-renderText({paste0("Calories")})
    output$intakepercentage<-renderText({paste0({misDatos$muestra2},"% daily intake" )})
    output$sport<-renderText({paste0( "misDatos$x minutes of", {misDatos$muestra3})})
  
})
  observeEvent(input$change,{
    output$tbl=renderDataTable(sportsdef,options = list(lengthChange = FALSE))
  
    
    })
  
})

