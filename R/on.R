#' @importFrom tibble tibble
NULL

#' @export
on <- function(verbose = FALSE) {
  # register_s3_method("base", "print", "data.table", print_html)
  register_s3_method("base", "print", "tbl_df", print_html)
  register_s3_method("base", "print", "data.frame", print_html)
  # register_s3_method("stats", "print", "ts", print_html)
  # register_s3_method("xts", "print", "xts", print_html)
  # register_s3_method("zoo", "print", "zoo", print_html)

  tv_set_status(TRUE)  # tell both sessions tv is on

  tv_remote_own_session()  # start tv session

  push_obj(tibble::tibble(...start.up = 0))  # empty start up

  if (verbose) {
    message("TV is on!")
  }
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

tv_set_status <- function(status = TRUE) {
  stopifnot(inherits(status, "logical"))
  cat(as.character(as.integer(status)), file = path_tv("tv_status"))
}

tv_get_status <- function() {
  ans <- readLines(con = file(path_tv("tv_status")), warn = FALSE)
  as.logical(as.integer(ans))
}



# did not work on first try

# #' @export
# print <- function(x, ...) {
#   # UseMethod("base::print")
#   print_html(x, ...)
# }

