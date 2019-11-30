
#' @export
push_obj <- function(x) {
  fst::write_fst(x, path = path_tv("obj.fst"), compress = 0)
  # check time stamp of update.txt, to make sure writing is complete
  fs::file_touch(path_tv("update.txt"))
  TRUE
}

#' @export
pull_obj <- function(path) {
  # path is ignored
  fst::read_fst(path_tv("obj.fst"))
}

#' @export
path_tv <- function(file = "obj.fst") {
  tv_dir <- "~/.tv_chache"
  fs::dir_create(tv_dir)
  fs::path(tv_dir, file)
}






# # A tibble: 2 x 13
#   expression               min median `itr/sec` mem_alloc `gc/sec` n_itr  n_gc
#   <bch:expr>            <bch:> <bch:>     <dbl> <bch:byt>    <dbl> <int> <dbl>
# 1 push_obj_qs(flights)  91.9ms  100ms      10.2   131.2MB        0     6     0
# 2 push_obj_fst(flights) 56.4ms   59ms      16.9    44.9KB        0     9     0
# # … with 5 more variables: total_time <bch:tm>, result <list>, memory <list>,
# #   time <list>, gc <list>


# # A tibble: 2 x 13
#   expression           min   median `itr/sec` mem_alloc `gc/sec` n_itr  n_gc
#   <bch:expr>         <bch> <bch:tm>     <dbl> <bch:byt>    <dbl> <int> <dbl>
# 1 push_obj_qs(iris)    2ms   2.15ms      458.    42.4KB     2.03   225     1
# 2 push_obj_fst(iris) 439µs 494.69µs     1908.    44.9KB     6.24   917     3
# # … with 5 more variables: total_time <bch:tm>, result <list>, memory <list>,
# #   time <list>, gc <list>

# bench::mark(
#   push_obj_qs(flights),
#   push_obj_fst(flights)
# )



