
<!-- README.md is generated from README.Rmd. Please edit that file -->

# okapi: Computer-assisted Personal Interview (CAPI) Tools <img src="man/figures/logo.png" width="200" align="right" />

<!-- badges: start -->

[![Project Status: WIP – Initial development is in progress, but there
has not yet been a stable, usable release suitable for the
public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
![R-CMD-check](https://github.com/rapidsurveys/odktools/workflows/R-CMD-check/badge.svg)
<!-- badges: end -->

Data collection using computer-assisted personal interviewing or CAPI
tools is now the standard approach for conducting surveys and studies. A
wide range of CAPI systems are currently being used. The ability to
interface with these systems helps in the overall data process. This
package provides interface functions to CAPI systems based on the [Open
Data Kit or ODK](https://getodk.org) technology.

## Installation

You can install the development version of `okapi` from
[GitHub](https://github.com/rapidsurveys/okapi) with:

``` r
if(!require(remotes)) install.packages("remotes")
remotes::install_github("rapidsurveys/okapi")
```

## Usage
