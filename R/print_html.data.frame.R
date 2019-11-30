
print_html.data.frame <- function(x, ...) {
  base:::print.data.frame(x)
  print_html_df(x)
}

print_html.tbl <- function(x, ...) {
  tibble:::print.tbl(x)
  print_html_df(x)
}

print_html.data.table <- function(x, ...) {
  data.table:::print.data.table(x)
  print_html_df(x)
}

print_html_df <- function(x, ...) {
  if (!interactive()) return(NULL)
  push_obj(limit_df(x))
}

# x <- nycflights13::flights
# limit_df(x)
limit_df <- function (x) {
  tv.max.cells <- 50000
  tv.max.rows <- 5000
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
