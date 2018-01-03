library(shiny)
library(DT)

shinyServer(function(input, output) {
  
  misDatos<-reactiveValues()
  
  misDatos$muestra<-data.frame(grammes=NA,Ingredient=NA,Calories=NA)
  
  NewEntry<-observe({
  
     row<-as.numeric(which(food4$product_name==input$ingrediente))
     Calories100<-as.numeric(food4[row,9])
     g<-isolate(as.numeric(input$gramos))
     Calories<-(g*Calories100)/100
      
    if (input$addboton > 0){
      newLine<-isolate(c(input$gramos,input$ingrediente,Calories))
      isolate(misDatos$muestra<-rbind(misDatos$muestra,newLine))
      } 
 
 })
  
  output$tabla<-renderTable({misDatos$muestra})
  
  output$calories<-renderText({paste0("Calories")})

})
