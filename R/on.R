#' @importFrom tibble tibble
NULL

on <- function(verbose = FALSE) {
  register_s3_method("base", "print", "tbl_df", tv_df)
  register_s3_method("base", "print", "data.frame", tv_df)
  register_s3_method("stats", "print", "ts", tv_ts)

  if (verbose) {
    message("TV is on!")
  }
}
