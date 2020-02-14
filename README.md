# tv: Show Data Frames in the Browser

The tv package lively displays data frames during data analysis.
It modifies the print method of data frames, tibbles or data tables to also appear in a browser or in the view pane of RStudio.

### Usage

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

### Ideas

- TV complements the R console output, it does not substitute. R console output will not be modified by TV.

- Large or other borderline cases should not delay the workflow. The number of rows or columns shown on TV will be limited accordingly. This should work:

```r
nycflights13::flights
```
