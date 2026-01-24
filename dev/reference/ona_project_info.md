# Get project info

Get project info

## Usage

``` r
ona_project_info(
  base_url = "https://api.ona.io",
  auth_mode = c("token", "password"),
  project_id = NULL
)
```

## Arguments

- base_url:

  ONA URL. Default is <https://api.ona.io>.

- auth_mode:

  Password or token? Default is token.

- project_id:

  Project identifier.

## Value

A tibble of projects.

## Examples

``` r
ona_project_info(project_id = 12345)
#> $detail
#> [1] "Invalid token header. No credentials provided."
#> 
```
