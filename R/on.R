#' @importFrom tibble tibble
NULL

on <- function(verbose = FALSE) {
  register_s3_method("base", "print", "tbl_df", print_html)
  register_s3_method("base", "print", "data.frame", print_html)
  register_s3_method("stats", "print", "ts", print_html)

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

