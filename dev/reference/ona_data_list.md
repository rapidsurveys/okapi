# Retrieve list of datasets available to specific user

Retrieve list of datasets available to specific user

## Usage

``` r
ona_data_list(
  base_url = "https://api.ona.io",
  auth_mode = c("token", "password")
)
```

## Arguments

- base_url:

  ONA URL. Default is <https://api.ona.io>.

- auth_mode:

  Password or token? Default is token.

## Value

A tibble of datasets available to specific user.

## Examples

``` r
ona_data_list()
#> # A tibble: 1 × 1
#>   x           
#>   <named list>
#> 1 <chr [1]>   
```
