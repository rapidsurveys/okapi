# List projects

List projects

## Usage

``` r
ona_project_list(
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

A tibble of projects.

## Examples

``` r
ona_project_list()
#> # A tibble: 1 × 1
#>   x           
#>   <named list>
#> 1 <chr [1]>   
```
