#' @importFrom tibble tibble
NULL

#' @export
on <- function(verbose = FALSE) {
  register_s3_method("base", "print", "data.table", print_html)
  register_s3_method("base", "print", "tbl_df", print_html)
  register_s3_method("base", "print", "data.frame", print_html)
  # register_s3_method("stats", "print", "ts", print_html)
  # register_s3_method("xts", "print", "xts", print_html)
  # register_s3_method("zoo", "print", "zoo", print_html)
  tv_remote_own_session()

  if (verbose) {
    message("TV is on!")
  }
}


# did not work on first try

# #' @export
# print <- function(x, ...) {
#   # UseMethod("base::print")
#   print_html(x, ...)
# }

