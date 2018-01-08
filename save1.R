library(shiny)
library(DT)

shinyServer(function(input, output) {
  
  misDatos<-reactiveValues()
  misDatos$muestra<-data.frame(grammes=NA,Ingredient=NA)
  
  #input$ingredient
  #Calories100<-as.numeric(food4$input$ingredient$energy_100g)
  #calories<-(Calories100*input$ingredient)/100
  
  NewEntry<-observe({
    
    if (input$addboton > 0){
      newLine<-isolate(c(input$gramos,input$ingrediente))
      isolate(misDatos$muestra<-rbind(misDatos$muestra,newLine))
    }
  })
  
  output$tabla<-renderTable({misDatos$muestra})
  
  output$calories<-renderText({paste0("Calories")})
  
  
})
