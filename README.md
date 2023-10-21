
<!-- README.md is generated from README.Rmd. Please edit that file -->

# okapi: Open Data Kit (ODK)-based Computer-assisted Personal Interview (CAPI) Tools <img src="man/figures/logo.png" width="200" align="right" />

<!-- badges: start -->

[![Project Status: WIP – Initial development is in progress, but there
has not yet been a stable, usable release suitable for the
public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![R-CMD-check](https://github.com/rapidsurveys/okapi/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/rapidsurveys/okapi/actions/workflows/R-CMD-check.yaml)
[![test-coverage](https://github.com/rapidsurveys/okapi/workflows/test-coverage/badge.svg)](https://github.com/rapidsurveys/okapi/actions)
[![Codecov test
coverage](https://codecov.io/gh/rapidsurveys/okapi/branch/main/graph/badge.svg)](https://codecov.io/gh/rapidsurveys/okapi?branch=main)
[![CodeFactor](https://www.codefactor.io/repository/github/rapidsurveys/okapi/badge)](https://www.codefactor.io/repository/github/rapidsurveys/okapi)
<!-- badges: end -->

Data collection using computer-assisted personal interviewing or CAPI
tools is now the standard approach for conducting surveys and studies. A
wide range of CAPI systems are currently being used. The ability to
interface with these systems helps in the overall data process. This
package provides interface functions to CAPI systems based on the [Open
Data Kit or ODK](https://getodk.org) technology.

## Motivation and development history

## The ODK ecosystem

## What does `okapi` do?

Currently, `okapi` provides functions to interface with two ODK-based
systems: [ONA](https://getodk.org) and
[KoboToolbox](https://kobotoolbox.org) via their respective APIs. The
current set of functions perform the following tasks:

1.  Authenticate with the respective servers using either an account
    password or an API token;

2.  List resources in the server available to interface with; and,

3.  Get data or resources from the server to
    [R](https://cran.r-project.org).

## Installation

<!---
You can install `okapi` from [CRAN](https://cran.r-project.org):
&#10;
```r
install.packages("okapi")
```
--->

You can install the development version of `okapi` from
[GitHub](https://github.com/rapidsurveys/okapi) with:

``` r
if(!require(remotes)) install.packages("remotes")
remotes::install_github("rapidsurveys/okapi")
```

## Usage

## Citation

If you find the `okapi` package useful, please cite using the suggested
citation provided by a call to the `citation` function as follows:

``` r
citation("okapi")
#> To cite okapi in publications use:
#> 
#>   Ernest Guevarra (2023). okapi: Open Data Kit (ODK)-based
#>   Computer-assisted Personal Interview (CAPI) Tools R package version
#>   0.1.0.9000 URL https://rapidsurveys.io/okapi/
#> 
#> A BibTeX entry for LaTeX users is
#> 
#>   @Manual{,
#>     title = {okapi: Open Data Kit (ODK)-based Computer-assisted Personal Interview (CAPI) Tools},
#>     author = {{Ernest Guevarra}},
#>     year = {2023},
#>     note = {R package version 0.1.0.9000},
#>     url = {https://rapidsurveys.io/okapi/},
#>   }
```

## Community guidelines

Feedback, bug reports and feature requests are welcome; file issues or
seek support [here](https://github.com/rapidsurveys/okapi/issues). If
you would like to contribute to the package, please see our
[contributing
guidelines](https://rapidsurveys.io/okapi/CONTRIBUTING.html).

This project is released with a [Contributor Code of
Conduct](https://rapidsurveys.io/okapi/CODE_OF_CONDUCT.html). By
participating in this project you agree to abide by its terms.
