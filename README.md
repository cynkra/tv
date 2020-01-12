# tv: Show Data Frames in the Browser

### Usage

Turn on TV and watch for data frames in your R session:

```r
tv::on()
```

Turn it off:

```r
tv::off()
```

(This doesn't stop the background shiny process, which need to be killed manually. FIXME.)


### Ideas

- TV complements the R console output, it does not substitute. R console output will not be modified by TV.

- Large or other borderline cases should not delay the workflow. The number of rows or columns shown on TV will be limited accordingly. This should work:

```r
nycflights13::flights
```


### Todo

- [ ] easily copypaste column names

- [x] store view. E.g., if you print as.data.frame(as.list(letters)), scroll to the right, call the same df again, it would be nice to be STILL at the end.
(This works relatively well in Reactable now.)


### Reactable vs Datatable

Switching back and forth, but Reactable is now my favorite.

#### Pros:

- Keeps Position, even, the width of columns if a modified data frame is displayed.

- Appears slicker and more robust


#### Cons:

- No server side support (but wasn't very useful anyway, limiting the data frame is fine)


#### Perhaps:

- Option to switch between Datatable and Reactable in the Menu, so we could experiment with Datatable for large datasets.







