
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

The main function, `get_git_commit_history()`, allows to quickly parse
the results of `git log` into an R data frame.

``` r
get_git_commit_history(from = "2021-01-01") %>% 
  knitr::kable()
```

| date                | message                                                           |
|:--------------------|:------------------------------------------------------------------|
| 2021-05-30 15:57:19 | Added {glue} as a dependency                                      |
| 2021-05-30 15:59:35 | get_git_commit_history() uses {glue} for constructing system call |
| 2021-05-30 15:59:58 | Minor namespace cleanup                                           |
| 2021-05-30 16:22:28 | Improved data filtering using dplyr::between()                    |
| 2021-05-30 16:53:37 | Using rlang::.data                                                |
| 2021-05-30 17:11:38 | Updated documentation                                             |
| 2021-05-30 17:11:47 | Bump version to 1.1.2                                             |
| 2021-05-30 17:12:16 | Updated README                                                    |

The `get_git_commit_count()` function is a wrapper of
`get_git_commit_history()` that can be used to calculate the amount of
commits done in a certain date range.

``` r
get_git_commit_count(from = "2019-12-01", to = "2019-12-31")
#> [1] 9
```
