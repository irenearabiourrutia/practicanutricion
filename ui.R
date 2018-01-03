food4<-read.csv("/Users/irenearabiourrutia/Desktop/food4",header=TRUE,sep=";")
library(shiny)

shinyUI(fluidPage(
  sidebarLayout(
    sidebarPanel(
      selectInput("ingrediente","Ingredient",c(unique(as.character(food4$product_name)))),
      textInput("gramos","Grammes"),
      actionButton("addboton","Add")
    ), 
    mainPanel(
      verbatimTextOutput("calories"),
      tableOutput("tabla"),
      actionButton("change","Change")
    )
  )
))



