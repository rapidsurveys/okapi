# List organisations

List organisations

## Usage

``` r
ona_org_list(
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

A tibble of organisations.

## Examples

``` r
ona_org_list()
#> # A tibble: 1 × 1
#>   x           
#>   <named list>
#> 1 <chr [1]>   
```
