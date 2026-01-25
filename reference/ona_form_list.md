# List published forms

List published forms

## Usage

``` r
ona_form_list(
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

A tibble of published forms.

## Examples

``` r
ona_form_list()
#> # A tibble: 1 × 1
#>   x           
#>   <named list>
#> 1 <chr [1]>   
```
