print_html.data.frame <- function(x, ...) {

  print(rhandsontable::rhandsontable(
    limit_df(x),
    readOnly = TRUE,
    contextMenu = FALSE
  ))

  # print(
  #   hot_heatmap(
  #     rhandsontable::rhandsontable(
  #       limit_df(x),
  #       readOnly = TRUE,
  #       contextMenu = FALSE,
  #     ),
  #     color_scale = c("#af8dc3", "#7fbf7b")
  #   )
  # )


  # we don't want to change default behavior
  if (inherits(x, "tbl")) tibble:::print.tbl(x)
  if (inherits(x, "data.frame")) base:::print.data.frame(x)

}


limit_df <- function (x) {
  tv.max.cells <- 1000
  tv.max.rows <- 1000
  tv.max.cols <- 500

  # the idea is that seeing cols is more important than seeing rows
  tv.col.precedence <- TRUE

  stopifnot(tv.max.cells <= tv.max.rows * tv.max.cols)
  z <- x
  if (nrow(x) * ncol(x) > tv.max.cells) {
    rows <- min(nrow(x), tv.max.rows)
    cols <- min(ncol(x), tv.max.cols)
    if (tv.col.precedence) {
      rows <- floor(tv.max.cells / cols)
    } else {
      cols <- floor(tv.max.cells / rows)
    }
    z <- x[seq(rows), seq(cols)]
  }
  z
}
