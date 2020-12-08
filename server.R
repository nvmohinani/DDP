#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library(shiny)
library(dplyr)
players <- read.csv("players_20.csv", header = TRUE)
players
fifa1 <- players[-c(61:18278), ]
fifa2 <- fifa1[-c(4, 7, 14, 15, 26, 29, 31, 32, 33, 54), ]
fifa3 <- fifa2[, -c(1, 2, 4, 6, 9, 10, 12:17, 20:31, 38:104)]
fifa3

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$table <- renderDataTable({

        # generate bins based on input$bins from ui.R
        age_seq <- seq(from = input$age[1], to = input$age[2], by = .1)
        height_cm_seq <- seq(from = input$height_cm[1], to = input$height_cm[2], by = .1)
        weight_kg_seq <- seq(from = input$weight_kg[1], to = input$weight_kg[2], by = .1)
        overall_seq <- seq(from = input$overall[1], to = input$overall[2], by = .1)
        pace_seq <- seq(from = input$pace[1], to = input$pace[2], by = .1)
        shooting_seq <- seq(from = input$shooting[1], to = input$shooting[2], by = .1)
        passing_seq <- seq(from = input$passing[1], to = input$passing[2], by = .1)
        dribbling_seq <- seq(from = input$dribbling[1], to = input$dribbling[2], by = .1)
        defending_seq <- seq(from = input$defending[1], to = input$defending[2], by = .1)
        physic_seq <- seq(from = input$physic[1], to = input$physic[2], by = .1)
        
        
        data1 <- filter(fifa3, age %in% age_seq, height_cm %in% height_cm_seq, weight_kg %in% weight_kg_seq, 
                       overall %in% overall_seq, weak_foot %in% input$weak_foot, skill_moves %in% input$skill_moves, 
                       pace %in% pace_seq, shooting %in% shooting_seq, 
                       passing %in% passing_seq, dribbling %in% dribbling_seq, 
                       defending %in% defending_seq, physic %in% physic_seq)
        
        data1
        


    })

})
