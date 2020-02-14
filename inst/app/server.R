library(shiny)
library(tv)
library(reactable)

r_data_frame <- reactiveFileReader(50, NULL, filePath = path_tv("tv_update"), pull_obj)

shinyServer(
  function(input, output, session) {


    if (FALSE) {
    output$oTable <- DT::renderDataTable({

      filter <- if (input$iHasFilter) "top" else "none"
      ordering <- input$iHasOrdering

      scrollY <- paste0(input$iScrollY, "vh")

      dta <- r_data_frame()

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
        extensions = c('KeyTable'),
        options = list(
          scrollY = scrollY,
          scrollX = TRUE,
          # deferRender = TRUE,
          # scroller = list(
          #   loadingIndicator = TRUE,
          #   displayBuffer = 7,
          #   boundaryScale = 0.5
          # ),
          # keys = TRUE,
          dom = 'tp',
          ordering = ordering
        )
      )
    })

    }


    output$oReactable <- reactable::renderReactable({

      dta <- r_data_frame()

      if ("rowname" %in% names(dta)) {
        dta <- tibble::column_to_rownames(tibble::remove_rownames(dta))
      }

      if (colnames(dta)[1] == "...start.up") {
        dta <- NULL
      }

      req(dta)



      reactable::reactable(
        dta,
        # defaultPageSize = 8,
        filterable        = input$opt_re_filterable,
        searchable        = input$opt_re_searchable,
        sortable          = input$opt_re_sortable,
        compact           = TRUE,
        bordered          = input$opt_re_bordered,
        resizable         = input$opt_re_resizable,
        highlight         = input$opt_re_highlight,
        striped           = input$opt_re_striped,
        wrap              = FALSE,
        fullWidth         = FALSE,
        pagination        = FALSE,
        height            = if (nrow(dta) < 8) "auto" else "calc(100vh - 48px)"
      )
    })

})
