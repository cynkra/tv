library(shiny)
library(tv)
library(reactable)

rObj <- reactiveFileReader(50, NULL, filePath = path_tv("update.txt"), pull_obj)

# Define server logic required to draw a histogram
shinyServer(
  function(input, output, session) {

    output$oTable <- DT::renderDataTable({

      filter <- if (input$iHasFilter) "top" else "none"

      pageLength <- input$iPageLength


      DT::datatable(
        rObj(),
        filter = filter,
        style = 'bootstrap',
        selection = "none",
        autoHideNavigation = FALSE,
        options = list(dom = 'tp', pageLength = pageLength),
        class = 'display nowrap'  # no mulitline cells
      )
    })


})
