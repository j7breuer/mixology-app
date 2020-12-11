

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


mdf <- read.csv("~/GitHub/mixology-app/Data/bartending_vertical.csv")

# Pre-processing on load

shinyServer(function(input, output, session){
    
})
