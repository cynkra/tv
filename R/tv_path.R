tv_path <- function(...) {
  tv_path <- .tv_env$tv_path
  file.path(tv_path, ...)
}

tv_set_path <- function(path) {
  .tv_env$tv_path <- path
  invisible(path)
}

