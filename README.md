# tv: Automatically show useful representations of objects in Browser (or Viewer, in RStudio)

### Ideas

- Complement, don't subsitute: tv shoud never change the look and feel of the console. Browser delay after console print.

    iris

- large or other borderline cases should never delay the workflow, tv should compress the object to make it tv approved

    nycflights13::flights

- Focus on dfs, but maybe also support other other objects (matrices, time series?)

    AirPassengers


### Todo

- [x] disable non-interactively
- [ ] easyly copy paste col names (that is a killer problem in tibbles that we should solve)


### Nice to haves

- store view. E.g., if you print as.data.frame(as.list(letters)), scroll to the right, call the same df again, it would be nice to be STILL at the end

