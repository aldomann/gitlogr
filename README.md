
# gitlogr <img src="man/figures/logo.png" align="right" width="120" />

<!-- badges: start -->

[![CRAN_Status_Badge](https://www.r-pkg.org/badges/version/gitlogr)](https://cran.r-project.org/package=gitlogr)
[![lifecycle](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://www.tidyverse.org/lifecycle/#stable)
<!-- [![R build status](https://github.com/aldomann/<package>/workflows/R-CMD-check/badge.svg)](https://github.com/aldomann/<package>/actions) -->
<!-- [![Codecov test coverage](https://codecov.io/gh/aldomann/<package>/branch/master/graph/badge.svg)](https://codecov.io/gh/aldomann/<package>?branch=master) -->
<!-- [![pkgdown status](https://github.com/aldomann/<package>/workflows/pkgdown/badge.svg)](https://aldomann.github.io/<package>/) -->
<!-- badges: end -->

## Overview

`{gitlogr}` aims to provide a clean way to get your Git commit history
and process it in R.

## Installation

<!-- You can install the released version of {gitlogr} from [CRAN](https://CRAN.R-project.org) with: -->
<!-- ``` r -->
<!-- install.packages("gitlogr") -->
<!-- ``` -->

The development version can be installed from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("aldomann/gitlogr")
```

## Examples

``` r
library(gitlogr)
```

The main function, `get_history()`, allows to quickly parse the results
of `git log` into an R data frame.

``` r
gitlogr::get_history(from = "2021-02-01", to = "2021-02-28") %>% 
  knitr::kable()
```

| date                | message                                                          |
|:--------------------|:-----------------------------------------------------------------|
| 2021-02-26 10:10:06 | Fixed message left trimming in get_git_commit_history() function |
| 2021-02-26 10:24:05 | Minor refactoring and proper usage of rlang::.data               |
| 2021-02-26 10:24:58 | Added clipboard parameter to get_git_commit_history() function   |
| 2021-02-26 10:25:36 | Added examples and badges to README file                         |
| 2021-02-26 10:25:46 | Updated documentation                                            |
| 2021-02-26 10:26:01 | Version bump to v1.1.2                                           |

The `count_commits()` function is a wrapper of `get_history()` that can
be used to calculate the amount of commits done in a certain date range.

``` r
gitlogr::count_commits(from = "2019-12-01", to = "2019-12-31")
#> [1] 9
```
