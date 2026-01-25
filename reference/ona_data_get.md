# Retrieve specific dataset by form ID from specific user

Retrieve specific dataset by form ID from specific user

## Usage

``` r
ona_data_get(
  base_url = "https://api.ona.io",
  auth_mode = c("token", "password"),
  form_id
)
```

## Arguments

- base_url:

  ONA URL. Default is <https://api.ona.io>.

- auth_mode:

  Password or token? Default is token.

- form_id:

  Form identifier.

## Value

A tibble of retrieved dataset.

## Examples

``` r
ona_data_get(form_id = 276175)
#> # A tibble: 1 × 1
#>   x           
#>   <named list>
#> 1 <chr [1]>   
```
