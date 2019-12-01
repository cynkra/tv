#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library(miniUI)
library(shiny)
library(reactable)

# Define UI for application that draws a histogram

miniPage(
      tags$head(tags$style(".dataTable {white-space: nowrap;}")),
      miniTabstripPanel(
        miniTabPanel("On TV",
          icon = icon("desktop"),
          miniContentPanel(
            fillCol(
              DT::dataTableOutput("oTable")
            )
          )
        ), miniTabPanel("Settings",
          icon = icon("cogs"),
          miniContentPanel(
            checkboxInput("iHasFilter", "Filter", FALSE),
            sliderInput("iPageLength", "Page Length", 1, 50, 8, step = 1)
          )
        )
      ),
      title = "TV"
    )

