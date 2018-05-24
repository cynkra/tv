#' @importFrom tibble tibble
NULL

tv_enable <- function(verbose = FALSE) {
  register_s3_method("base", "print", "tbl_df", print_tv)

  # Didn't work on first try
  # register_s3_method("base", "print", "data.frame", print_tv)

  if (verbose) {
    message("TV is on!")
  }
}
