#' @export
tv_remote <- function(tv_path, tv_port) {
  library(shiny)
  shiny::shinyOptions(tv_path = tv_path)
  runApp(system.file(package = "tv", "app"), port = tv_port)
}

#' @export
tv_remote_own_session <- function(tv_path, tv_port = 1234) {

  .tv_env$cl <- parallel::makeCluster(1)
  future::remote(tv::tv_remote(tv_path = tv_path, tv_port = tv_port), workers = .tv_env$cl)

  Sys.sleep(0.5)

  if (Sys.getenv("RSTUDIO") == "1") {
    rstudioapi::viewer("http://127.0.0.1:1234")
  } else {
    browseURL("http://127.0.0.1:1234")
  }

}
