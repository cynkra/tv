print_html.ts <- function(x, ...) {
  stats:::print.ts(x)
  print_html_ts(x)
}

print_html.xts <- function(x, ...) {
  print(xts:::print.xts(x))
  print_html_ts(x)
}

print_html.zoo <- function(x, ...) {
  zoo:::print.zoo(x)
  print_html_ts(x)
}

print_html_ts <- function(x, ...) {
  if (!interactive()) return(NULL)

  if (NCOL(x) > 29) {
    message("limiting tv to 29 series")
    x <- x[, 1:29]
  }

  d <- tsbox::ts_dygraphs(x, ...)
  d <- dygraphs::dyHighlight(
    d,
    highlightSeriesBackgroundAlpha = 0.5,
    highlightCircleSize = 0,
    highlightSeriesOpts = list(strokeWidth = 3, highlightCircleSize = 3),
    hideOnMouseOut = F
  )
  d <- dygraphs::dyOptions(
    d,
    animatedZooms = TRUE,
    colors = tsbox::colors_tsbox()[1:NCOL(x)],
    gridLineColor = "#E1E5EA",
    axisLineColor = "#303030"
  )

  # from: https://gist.github.com/timelyportfolio/cf7b94048ffe7b6a0112
  #this is a hack to set css directly
  #  dyCSS designed to read a text css file
  d$x$css = "
  .dygraph-legend > span {display:none;}
  .dygraph-legend > span.highlight { display: inline; }
  "

  print(d)

}
