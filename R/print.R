print_tv <- function(x, ...) {
  
  tv.max.cells <- 1000
  tv.max.rows <- 1000
  tv.max.cols <- 500

  # the idea is that seeing cols is more important than seeing rows
  tv.col.precedence <- TRUE

  stopifnot(tv.max.cells <= tv.max.rows * tv.max.cols)

  if (nrow(x) * ncol(x) > tv.max.cells) {
    message("tv: tibble has more than ", tv.max.cells, " cells. Output truncated.")
    rows <- min(nrow(x), tv.max.rows)
    cols <- min(ncol(x), tv.max.cols)

    if (tv.col.precedence) {
      rows <- floor(tv.max.cells / cols)
    } else {
      cols <- floor(tv.max.cells / rows)
    }

    x <- x[seq(rows), seq(cols)]
  }

  print(rhandsontable::rhandsontable(
    x, 
    readOnly = TRUE,
    contextMenu = FALSE
  )) 
  invisible(x)
}
