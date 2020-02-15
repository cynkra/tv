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
library(shinyWidgets)

miniPage(
      tags$head(
        tags$style(".dataTable {white-space: nowrap;}"),
        # make header one click selectable
        tags$style("
          .rt-th {
            user-select: all;
            -webkit-user-select: all;
            -moz-user-select: all;
            -ms-user-select: all;
          }
        ")
      ),
      miniContentPanel(
          reactable::reactableOutput("oReactable"),
          # DT::dataTableOutput("oTable", height = "100%")
        tags$div(style = "height: 4px;"), # spacing
        dropdownButton(
          inputId = "mydropdown",
          label = "Controls",
          size = "xs",
          icon = icon("ellipsis-h"),
          status = "default",
          circle = TRUE,
          right = FALSE,
          up = TRUE,
              checkboxInput("opt_re_filterable",   "filterable", FALSE),
              checkboxInput("opt_re_sortable",     "sortable",   FALSE),
              checkboxInput("opt_re_searchable",   "searchable", FALSE),
              checkboxInput("opt_re_highlight",    "highlight",  FALSE),
              checkboxInput("opt_re_striped",      "striped",    TRUE),
              checkboxInput("opt_re_bordered",     "bordered",   TRUE),
              checkboxInput("opt_re_resizable",    "resizable",  TRUE),
              shiny::actionButton("turn_off", "Turn off", icon = icon("power-off"))
        ),
        scrollable = TRUE
      ),
      title = "TV"
    )
