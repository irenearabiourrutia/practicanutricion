library(shiny)
library(DT)
library(shinyBS)
FoodFacts<-read.csv("/Users/irenearabiourrutia/Desktop/FoodFacts.csv",header=TRUE,sep=",")
sportsdef<-read.csv("/Users/irenearabiourrutia/Desktop/sportsdef.csv",header=TRUE,sep=";")

shinyUI(fluidPage(
  sidebarLayout(
    sidebarPanel(
      selectInput("ingrediente","Ingredient",c(unique(as.character(food4$product_name)))),
      textInput("gramos","Grammes"),
      textInput("intake","Daily intake"),
      actionButton("addboton","Add")
    ), 
    mainPanel(
      verbatimTextOutput("cal"),
      tableOutput("table"),
      verbatimTextOutput("intakepercentage"),
      verbatimTextOutput("sport"),
      actionButton("change","Change"),
      bsModal("modalExample", "Data Table", "change", size = "large",
              dataTableOutput("tbl"))
      
    )
  )
))



