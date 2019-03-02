print_html.ts <- function(x, ...) {
  stats:::print.ts(x)
  if (interactive()) print(tsbox::ts_dygraphs(x, ...))
}