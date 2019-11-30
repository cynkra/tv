#' @export
tv_remote <- function() {
  library(shiny)
  runApp(system.file(package = "tv", "app"), port = 1234)
}

#' @export
tv_remote_own_session <- function() {

  cl <- parallel::makeCluster(1)
  future::remote(tv::tv_remote(), workers = cl)

  Sys.sleep(0.5)

  if (Sys.getenv("RSTUDIO") == "1") {
    rstudioapi::viewer("http://127.0.0.1:1234")
  } else {
    browseURL("http://127.0.0.1:1234")
  }

}

#
