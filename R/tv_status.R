tv_set_status <- function(status = TRUE) {
  stopifnot(inherits(status, "logical"))
  cat(as.character(as.integer(status)), file = tv_path("tv_status"))
}

tv_get_status <- function() {
  if (!file.exists(tv_path("tv_status"))) return(FALSE)
  con = file(tv_path("tv_status"))
  on.exit(close(con))
  ans <- readLines(con = con, warn = FALSE)
  as.logical(as.integer(ans))
}
