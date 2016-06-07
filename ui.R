library(shiny)
library(shinyjs)
library(shinydashboard)
library(rhandsontable)

title <- paste("Team Time:")

dashboardPage(
  dashboardHeader(title=title),
  dashboardSidebar(
    useShinyjs(),
    radioButtons("curPrevRadio", "Display:", c("Current", "Next"), selected="Current", 
                 inline=TRUE),
    actionButton("savebutton", "Save", icon=icon("floppy-o")), 
    br(),
    actionButton("save2curr", "Save to Current"),
    actionButton("save2next", "Save to Next")
  ),
  dashboardBody(
    dateRangeInput("dateRange", "For Dates"),
    rHandsontableOutput("hot"),
    radioButtons("plotType", label="By", choices=c("Person", "Area"), inline=TRUE),
    plotOutput("teamPlot", width="600px")
  ),
  title=title
)
