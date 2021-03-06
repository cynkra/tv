# installs dependencies, runs R CMD check, runs covr::codecov()
# FIXME: Set to error_on="note" when package is more mature
do_package_checks(error_on = "error")

if (ci_on_ghactions() && ci_has_env("BUILD_PKGDOWN")) {
  # creates pkgdown site and pushes to gh-pages branch
  # only for the runner with the "BUILD_PKGDOWN" env var set

  get_stage("deploy") %>%
    add_step(step_install_github("cynkra/cynkratemplate"))
  do_pkgdown()
}
