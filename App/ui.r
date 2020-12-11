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

mdf <- read.csv("~/GitHub/mixology-app/Data/bartending_vertical.csv", stringsAsFactors = FALSE)
end_string = ''
string_oupt = ''
vec_type = ''
final_oupt = ''
counter = 1
for (j in sort(unique(mdf$Ingredient.Type))){
  beginning_string = paste0('fluidRow( \n\t h4("', j, '"),\n')
  counter2 = 1
  end_string = ''
  for (i in sort(unique(mdf$Ingredient[mdf$Ingredient.Type==j]))){
    if (counter2 != length(unique(mdf$Ingredient[mdf$Ingredient.Type == j]))){
      cur_paste = paste0('\n box( \n\t title = "', i, '", \n\t width = 2, \n\t height = "300px", \n\t status = "info", \n\t actionButton("add_to_cart", "Add to My List"), \n\t img(src = "images/', gsub(" ", "_", tolower(i)),'.jpg", height = "25%", width = "25%", align = "top") \n ),')
      end_string = paste0(end_string, cur_paste, collapse = '')
    } else {
      cur_paste = paste0('\n box( \n\t title = "', i, '", \n\t width = 2, \n\t height = "100px", \n\t status = "info" \n ) \n)')
      end_string = paste0(end_string, cur_paste, collapse = '')
    }
    counter2 = counter2 + 1
  }
  full_string = paste0(beginning_string, end_string, collapse =  '')
  vec_type = c(vec_type, j)
  string_oupt = c(string_oupt, full_string)
  if (counter == length(unique(mdf$Ingredient.Type))){
    final_oupt = paste0(final_oupt, full_string)
  } else {
    final_oupt = paste0(final_oupt, full_string, ",\n\n")
  }
  counter = counter + 1
}
string_oupt = string_oupt[2:17]
to_shiny = ''
for (i in 1:length(string_oupt)){
  if (i < length(string_oupt)){
    to_shiny = paste0(to_shiny, string_oupt[i], ',\n')
  } else {
    to_shiny = paste0(to_shiny, string_oupt[i])
  }
}
cat(to_shiny)


df = as.data.frame(cbind("Type" = vec_type, 
                         "String" = string_oupt),
                   stringsAsFactors = F)
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
                        fluidRow(
                            eval(parse(text = string_oupt[1]))
                        ),
                        fluidRow(
                            eval(parse(text = string_oupt[2]))
                        ),
                        fluidRow(
                            eval(parse(text = string_oupt[3]))
                        ),
                        fluidRow(
                            eval(parse(text = string_oupt[4]))
                        ),
                        fluidRow(
                            eval(parse(text = string_oupt[5]))
                        ),
                        fluidRow(
                            eval(parse(text = string_oupt[6]))
                        ),
                        fluidRow(
                            eval(parse(text = string_oupt[7]))
                        ),
                        fluidRow(
                            eval(parse(text = string_oupt[8]))
                        ),
                        fluidRow(
                            eval(parse(text = string_oupt[9]))
                        ),
                        fluidRow(
                            eval(parse(text = string_oupt[10]))
                        ),
                        fluidRow(
                            eval(parse(text = string_oupt[11]))
                        ),
                        fluidRow(
                            eval(parse(text = string_oupt[12]))
                        ),
                        fluidRow(
                            eval(parse(text = string_oupt[13]))
                        ),
                        fluidRow(
                            eval(parse(text = string_oupt[14]))
                        ),
                        fluidRow(
                            eval(parse(text = string_oupt[15]))
                        ),
                        fluidRow(
                            eval(parse(text = string_oupt[16]))
                        )
                    )    
                ),
                tabPanel(
                    "My Collection",
                    fluidPage(

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