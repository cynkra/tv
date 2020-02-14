#' @importFrom tibble tibble
NULL

#' @export
on <- function(verbose = FALSE) {


  tv_path <- file.path(tempdir(), "tv_cache")
  fs::dir_create(tv_path)

  # tv_path <- "~/.tv_cache"
  tv_set_path(tv_path)

  # register_s3_method("base", "print", "data.table", print_html)
  register_s3_method("base", "print", "tbl_df", print_html)
  register_s3_method("base", "print", "data.frame", print_html)
  # register_s3_method("stats", "print", "ts", print_html)
  # register_s3_method("xts", "print", "xts", print_html)
  # register_s3_method("zoo", "print", "zoo", print_html)


  tv_set_status(TRUE)  # tell both sessions tv is on

  tv_remote_own_session(tv_path)  # start tv session

  push_obj(tibble::tibble(...start.up = 0))  # empty start up

  if (verbose) {
    message("TV is on!")
  }

  return(invisible(TRUE))
}

#' @export
off <- function(verbose = FALSE) {

  tv_set_status(FALSE)  # tell tv session to perform suicide

  tv_unregister()

  if (verbose) {
    message("TV is off!")
  }
}

tv_unregister <- function() {
  push_obj(tibble::tibble(...start.up = 0))  # empty start up
  # register_s3_method("base", "print", "data.table", print_html)
  register_s3_method("base", "print", "tbl_df", tibble:::print.tbl)
  register_s3_method("base", "print", "data.frame", print.data.frame)
}



# did not work on first try

# #' @export
# print <- function(x, ...) {
#   # UseMethod("base::print")
#   print_html(x, ...)
# }

