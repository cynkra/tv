library(shiny)
library(tv)
library(reactable)

rObj <- reactiveFileReader(50, NULL, filePath = path_tv("update.txt"), pull_obj)

# Define server logic required to draw a histogram
shinyServer(
  function(input, output, session) {

    output$oTable <- DT::renderDataTable({

      filter <- if (input$iHasFilter) "top" else "none"
      ordering <- input$iHasOrdering

      scrollY <- paste0(input$iScrollY, "vh")

      dta <- rObj()

      if ("rowname" %in% names(dta)) {
        dta <- tibble::column_to_rownames(tibble::remove_rownames(dta))
      }

      deferRender <- if (nrow(dta) > 1000) TRUE else FALSE

      if (colnames(dta)[1] == "...start.up") {
        dta <- NULL
      }

      DT::datatable(
        dta,
        filter = filter,
        style = 'bootstrap',
        selection = "none",
        autoHideNavigation = TRUE,
        rownames = TRUE,
        extensions = c('Scroller', 'KeyTable'),
        options = list(
          scrollY = scrollY,
          scrollX = TRUE,
          deferRender = TRUE,
          scroller = list(
            loadingIndicator = TRUE,
            displayBuffer = 7,
            boundaryScale = 0.5
          ),
          keys = TRUE,
          dom = 't',
          ordering = ordering
        )
      )
    })


})
