#' Show Exchange Path of TV
#'
#' The main R session uses this path to exchange information with the TV session.
#' Exported for debugging.
#'
#' @keywords internal
path <- function(...) {
  tv_path <- .tv_env$tv_path
  file.path(tv_path, ...)
}

set_path <- function(path) {
  .tv_env$tv_path <- path
  invisible(path)
}

