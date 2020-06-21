# tv: Show Data Frames in the Browser

<!-- badges: start -->
[![tic](https://github.com/cynkra/tv/workflows/tic/badge.svg?branch=master)](https://github.com/cynkra/tv/actions)
<!-- badges: end -->

The tv package lively displays data frames during data analysis.
It modifies the print method of data frames, tibbles or data tables to also appear in a browser or in the view pane of RStudio.

<img src="https://raw.githubusercontent.com/cynkra/tv/master/inst/screenshot/tv.png" width="65%"/>


### Use

Turn on the TV and watch for data frames in your R session:

```r
tv::on()
```

TV is turned off:

1. if the last TV browser tab is closed
2. if turned off from the settings menu
3. by entering `tv::off()` in the R session
4. if `tempdir()` is deleted.

Turning off will restore the print method of data frames.


### Install

```r
remotes::install_github("cynkra/tv")
```

### Ideas

- TV complements the R console output, it does not substitute. R console output will not be modified by TV.

- Large or other borderline cases should not delay the workflow. The number of rows or columns shown on TV will be limited accordingly. This should work:

```r
nycflights13::flights
```
