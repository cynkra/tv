#' @export
tv_remote <- function() {
  library(shiny)
  runApp(system.file(package = "tv", "app"), port = 1234)
}

.tv_env <- new.env()

#' @export
tv_remote_own_session <- function() {

  .tv_env$cl <- parallel::makeCluster(1)
  future::remote(tv::tv_remote(), workers = .tv_env$cl)

  Sys.sleep(0.5)

  # prot nummer : 4096 - 2^16-
  #

  # same as getOption("shiny.port")


  # FIXME use curl to check if there

  # FIXME check

  if (Sys.getenv("RSTUDIO") == "1") {
    rstudioapi::viewer("http://127.0.0.1:1234")
  } else {
    browseURL("http://127.0.0.1:1234")
  }

}
