#' @export
tv_turn_on <- function() {
  library(shiny)
  runApp(system.file(package = "tv", "app"), port = 1234)
}

#' @export
tv_turn_on_own_session <- function() {
  system("Rscript -e 'tv::tv_turn_on()", wait = FALSE)
}

#

# either:
# rstudioapi::viewer("http://127.0.0.1:1234")


# or: browseURL("http://127.0.0.1:1234")


