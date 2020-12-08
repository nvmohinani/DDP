#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(dplyr)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Compare FIFA Ratings of Top Outfield Players"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
                helpText("Select player attributes"),
            sliderInput("age", "Age", min=19, max=37, value=c(19,37), step = 1),
            sliderInput("height_cm", "Height", min=163, max=195, value=c(163,195), step = 1),
            sliderInput("weight_kg", "Weight", min=59, max=97, value=c(59,97), step = 1),
            sliderInput("overall", "Overall Rating", min=1, max=99, value=c(1,99), step = 1),
            checkboxGroupInput("weak_foot", "Weak Foot Rating", c(1, 2, 3, 4, 5), selected = c(1, 2, 3, 4, 5)), 
            checkboxGroupInput("skill_moves", "Skill Rating", c(1, 2, 3, 4, 5), selected = c(1, 2, 3, 4, 5)),
            sliderInput("pace", "Pace", min=1, max=99, value=c(1,99), step = 1),
            sliderInput("shooting", "Shooting", min=1, max=99, value=c(1,99), step = 1),
            sliderInput("passing", "Passing", min=1, max=99, value=c(1,99), step = 1),
            sliderInput("dribbling", "Dribbling", min=1, max=99, value=c(1,99), step = 1),
            sliderInput("defending", "Defending", min=1, max=99, value=c(1,99), step = 1),
            sliderInput("physic", "Physicality", min=1, max=99, value=c(1,99), step = 1),
            
            submitButton("Filter")
        ),

        # Show table
        mainPanel(
                dataTableOutput("table")
        )
    )
))
