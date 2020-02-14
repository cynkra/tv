#' @importFrom tibble tibble
NULL


#' Turn TV on and off
#'
#' @param verbose talk to the user
#' @param port port number, if `NULL`, use a random port.
#'
#' @export
#' @examples
#' \dontrun{
#' tv::on()
#' iris
#'
#' tv::off()
#' }
on <- function(verbose = FALSE, port = NULL) {

  if (is.null(port)) port <- random_port()


  tv_path <- file.path(tempdir(), "tv_cache")
  fs::dir_create(tv_path)

  # tv_path <- "~/.tv_cache"
  set_path(tv_path)

  if (status()) {
    message("TV is already on.")
    return(invisible(TRUE))
  }

  # register_s3_method("base", "print", "data.table", print_html)
  register_s3_method("base", "print", "tbl_df", print_html)
  register_s3_method("base", "print", "data.frame", print_html)
  # register_s3_method("stats", "print", "ts", print_html)
  # register_s3_method("xts", "print", "xts", print_html)
  # register_s3_method("zoo", "print", "zoo", print_html)


  set_status(TRUE)  # tell both sessions tv is on

  remote_tv_in_own_session(path = tv_path, port = port)  # start tv session

  push_obj(tibble::tibble(...start.up = 0))  # empty start up

  if (verbose) {
    message("TV is on!")
  }

  return(invisible(TRUE))
}

#' @name on
#' @export
off <- function(verbose = FALSE) {

  set_status(FALSE)  # tell tv session to perform suicide

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

