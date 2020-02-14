#' @export
tv_remote <- function(tv_path, tv_port) {
  library(shiny)
  shiny::shinyOptions(tv_path = tv_path)
  runApp(system.file(package = "tv", "app"), port = tv_port)
}

#' @export
tv_remote_own_session <- function(tv_path, tv_port) {

  .tv_env$cl <- parallel::makeCluster(1)
  future::remote(tv::tv_remote(tv_path = tv_path, tv_port = tv_port), workers = .tv_env$cl)

  Sys.sleep(0.5)

  tv_url <- paste0("http://127.0.0.1:", tv_port)

  if (Sys.getenv("RSTUDIO") == "1") {
    rstudioapi::viewer(tv_url)
  } else {
    browseURL(tv_url)
  }

}

