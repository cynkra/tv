random_port <- function() {
  use <- 3000 + sample(8000 - 3000, 1) - 1
  # same as in shiny::runApp
  dont_use <- c(3659, 4045, 6000, 6665:6669, 6697)
  port <- sample(setdiff(3000:8000, dont_use), 1)
  port
}
