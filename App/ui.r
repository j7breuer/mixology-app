#----#
# UI #
#----#
require(shinydashboard)
require(ggplot2)
require(dygraphs)
require(shinyBS)
require(quantmod)
require(plyr)
require(dashboardthemes)
require(shinyjs)
require(shinycssloaders)
require(pander)
require(dplyr) 
require(rlang)
require(shinyWidgets)

mdf <- read.csv("~/GitHub/mixology-app/Data/bartending_vertical.csv", stringsAsFactors = FALSE)

shinyUI(
    dashboardPage(
        dashboardHeader(title = ""),
        dashboardSidebar(
            sidebarMenu(
                menuItem(
                    'Sample 1'
                ),
                menuItem(
                    'sample 2'
                )
            )   
        ),
        dashboardBody(
            tags$style(HTML("
                            #images {
                                border: 6px double grey;
                            },

                            ")
                        ),
            shinyDashboardThemes(
                theme = 'grey_dark'
            ),
            tabsetPanel(
                tabPanel(
                    "Home Page",
                    fluidPage(
                        
                    )
                ),
                tabPanel(
                    "Ingredients",
                    fluidPage(
                        br(),br(),
                        uiOutput("dynammic_drink_cards")
                    )    
                ),
                tabPanel(
                    "My Collection",
                    fluidPage(
                        br(),br(),
                        uiOutput("my_dynammic_drink_cards")
                    )
                ),
                tabPanel(
                    "Recipes",
                    fluidPage(

                    )
                ),
                tabPanel(
                    "Favorites",
                    fluidPage(
                        
                    )
                )
            )
        )
    )
)