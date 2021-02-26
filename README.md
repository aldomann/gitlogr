
# gitlogr <img src="man/figures/logo.png" align="right" width="120" />

<!-- badges: start -->

[![CRAN\_Status\_Badge](https://www.r-pkg.org/badges/version/gitlogr)](https://cran.r-project.org/package=gitlogr)
[![lifecycle](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://www.tidyverse.org/lifecycle/#stable)
<!-- [![R build status](https://github.com/aldomann/<package>/workflows/R-CMD-check/badge.svg)](https://github.com/aldomann/<package>/actions) -->
<!-- [![Codecov test coverage](https://codecov.io/gh/aldomann/<package>/branch/master/graph/badge.svg)](https://codecov.io/gh/aldomann/<package>?branch=master) -->
<!-- [![pkgdown status](https://github.com/aldomann/<package>/workflows/pkgdown/badge.svg)](https://aldomann.github.io/<package>/) -->
<!-- badges: end -->

## Overview

{gitlogr} aims to provide a clean way to get your Git commit history and
process it in R.

## Installation

<!-- You can install the released version of gitlogr from [CRAN](https://CRAN.R-project.org) with: -->
<!-- ``` r -->
<!-- install.packages("gitlogr") -->
<!-- ``` -->
<!-- And  -->

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

``` r
get_git_commit_count(from = "2019-12-13", to = "2019-12-15")
#> [1] 9
```

``` r
get_git_commit_history(from = "2019-12-13", to = "2019-12-15") %>% 
  knitr::kable()
```

| date                | message                                                         |
|:--------------------|:----------------------------------------------------------------|
| 2019-12-13 08:36:28 | Initial commit                                                  |
| 2019-12-13 08:37:22 | Add GitHub links to DESCRIPTION                                 |
| 2019-12-13 08:48:00 | Migrated get\_git\_commit\_history() function from alfR package |
| 2019-12-13 08:48:12 | Updated LICENSE                                                 |
| 2019-12-13 08:51:00 | Updated DESCR                                                   |
| 2019-12-13 08:51:11 | Updated Rbuildignore file                                       |
| 2019-12-13 08:59:42 | Added README                                                    |
| 2019-12-13 09:17:56 | Added get\_git\_commit\_count() function                        |
| 2019-12-13 17:06:40 | Added logo                                                      |
