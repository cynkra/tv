library(shiny)
library(tv)
library(reactable)

rObj <- reactiveFileReader(50, NULL, filePath = path_tv("update.txt"), pull_obj)

# Define server logic required to draw a histogram
shinyServer(
  function(input, output, session) {

    output$oTable <- renderReactable({
      reactable(
        rObj(),
        filterable = TRUE,
        sortable = TRUE,
        pagination = FALSE
      )
    })


})
