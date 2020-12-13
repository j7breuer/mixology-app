

#--------------#
# Start Server #
#--------------#

require(shinydashboard)
require(ggplot2)
require(dygraphs)
require(shinyBS)
require(quantmod)
require(plyr)
require(dashboardthemes)
require(shinyjs)
require(shinycssloaders)
require(shinyWidgets)

rm(list=ls())

my_cards_to_ui = list()
mdf <- read.csv("~/GitHub/mixology-app/Data/bartending_vertical.csv", stringsAsFactors = FALSE)
create_cards <- function(df){
    cards_to_ui <- list()
    counter = 1
    for (i in 1:length(unique(df$Ingredient))){
        cur_val <- sort(unique(df$Ingredient))[i]
        cards_to_ui[[counter]] <-   box(    
                                            title = h3(cur_val, align = 'center'), 
                                            #background = 'gray',
                                            width = 1, 
                                            height = '350px', 
                                            status = 'primary', 
                                            img(        
                                                    id = "images",
                                                    src = paste0('images/', gsub(' ', '_', tolower(iconv(cur_val, to = "ASCII//TRANSLIT"))), '.jpg'), 
                                                    height = 150, 
                                                    width = 150, 
                                                    style="display: block; margin-left: auto; margin-right: auto;"),
                                            br(),
                                            actionButton(paste0("add_to_collection_", counter), "Add to My Collection", align = "center"),
                                            align = 'center', 
                                            style = 'margin-bottom: 10px;',
                                            style = 'margin-top: -10px;'
                                        )
        counter = counter + 1
    }
    return(cards_to_ui)
}

create_my_cards <- function(df, placement){
    cur_val <- sort(unique(df$Ingredient))[placement]
    my_cards_to_ui[[length(my_cards_to_ui)+1]] <- box(    
                                                        title = h3(cur_val, align = 'center'), 
                                                        #background = 'gray',
                                                        width = 1, 
                                                        height = '350px', 
                                                        status = 'primary', 
                                                        img(        
                                                                id = "images",
                                                                src = paste0('images/', gsub(' ', '_', tolower(cur_val)), '.jpg'), 
                                                                height = 150, 
                                                                width = 150, 
                                                                style="display: block; margin-left: auto; margin-right: auto;"),
                                                        br(),
                                                        actionButton(paste0("remove_to_collection_", placement), "Remove From My Collection", align = "center"),
                                                        align = 'center', 
                                                        style = 'margin-bottom: 10px;',
                                                        style = 'margin-top: -10px;'
                                                    )
    return(my_cards_to_ui)                                                    
}


my_collection_ids <<- c()
my_collection_ids_to_remove <<- c()

add_to_collection_func <- function(df, input, ids){
    for (i in 1:length(unique(df$Ingredient))){
        eval(parse(text = paste0("ids[",i,"] <- input$add_to_collection_",i)))
    }
    for (i in 1:length(ids)){
        if (ids[i] > 0){
            my_cards_to_ui <<- create_my_cards(df, i)
        }
    }
    return(list(cards = unique(my_cards_to_ui), new_ids = ids))
}

shinyServer(function(input, output, session){

    output$my_dynammic_drink_cards <- renderUI({
        vals_to_display <- add_to_my_collection_react()
        vals_not_to_display <- remove_from_collection_react()
        print(vals_not_to_display)
        if (!is.null(vals_to_display)){
            unique(vals_to_display)
        }
    })

    output$dynammic_drink_cards <- renderUI({create_cards(mdf)})
    
    add_to_my_collection_react <- reactive({
        my_cards_to_ui <<- add_to_collection_func(mdf, input, my_collection_ids)$cards
        my_collection_ids <<- add_to_collection_func(mdf, input, my_collection_ids)$new_ids
        return(my_cards_to_ui)
    })

    remove_from_collection_react <- reactive({
        for (i in 1:length(unique(mdf$Ingredient))){
            #eval(parse(text = paste0("my_collection_ids_to_remove[",i,"] <- input$remove_to_collection_",i)))
            eval(parse(text = paste0("print(input$remove_to_collection_",i, ")")))
        }
        for (i in 1:length(my_collection_ids_to_remove)){
            if (!is.null(my_collection_ids_to_remove[i])){
                my_collection_ids[i] <- 0
            }
        }
        return(my_collection_ids)        
    })

})
