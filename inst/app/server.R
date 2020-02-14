library(shiny)
library(tv)
library(reactable)

r_data_frame <- reactiveFileReader(50, NULL, filePath = tv_path("tv_update"), pull_obj)

r <- reactiveValues(session_count = 0)

shinyServer(
  function(input, output, session) {

    # turn tv off --------------------------------------------------------------

    # stop app AND and terminate R session if status 0

    # status 0 can be triggered by:
    # - from main session (by tv:::tv_set_status(FALSE))
    # - turn off button
    # - last shiny session closed

    r_status <- reactiveFileReader(1000, session, tv_path("tv_status"), function(file) tv:::tv_get_status())
    observe({
      status <- r_status()
      if (!status) {
        shiny::stopApp(quit(save = "no"))
      }
    })

    observe({
      inp <- input$turn_off
      req(inp)
      tv:::tv_set_status(FALSE) # tell main session (and tv session) tv is off
    })

    # if LAST session is closed, sligtly better than:
    # https://stackoverflow.com/a/45590324/946850

    # Source: https://gist.github.com/trestletech/9926129
    # Increment the number of sessions when one is opened.
    # We use isolate() here to:
    #  a.) Provide a reactive context
    #  b.) Ensure that this expression doesn't take a reactive dependency on
    #      vals$count -- if it did, every time vals$count changed, this expression
    #      would run, leading to an infinite loop.
    isolate(r$session_count <- r$session_count + 1)
    # When a session ends, decrement the counter.
    session$onSessionEnded(function() {
      if (isolate(r$session_count) < 2) {
        tv:::tv_set_status(FALSE)
        # app does not check status after this, so we need kill it here
        shiny::stopApp(quit(save = "no"))
      }
      # We use isolate() here for the same reasons as above.
      isolate(r$session_count <- r$session_count - 1)
    })

    # main display -------------------------------------------------------------


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
