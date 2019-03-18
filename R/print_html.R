#' @export
print_html <- function(x, ...) {
  UseMethod("print_html")
}

#' @export
#' @method print_html default
print_html.default <- function(x, ...) {
  print(x)
}

