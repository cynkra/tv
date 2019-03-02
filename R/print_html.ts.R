print_html.ts <- function(x, ...) {
  print(tsbox::ts_dygraphs(x, ...))
  stats:::print.ts(x)
}