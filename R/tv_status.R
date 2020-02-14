set_status <- function(status = TRUE) {
  stopifnot(inherits(status, "logical"))
  cat(as.character(as.integer(status)), file = path("tv_status"))
}


#' Show Status of TV
#'
#' `TRUE`: on, `FALSE: off. Exported for debugging.
#'
#' @export
status <- function() {
  if (!file.exists(path("tv_status"))) return(FALSE)
  con = file(path("tv_status"))
  on.exit(close(con))
  ans <- readLines(con = con, warn = FALSE)
  as.logical(as.integer(ans))
}
