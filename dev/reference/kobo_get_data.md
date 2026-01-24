# Retrieve specific dataset by form ID from specific user

Retrieve specific dataset by form ID from specific user

## Usage

``` r
kobo_get_data(
  base_url = "https://kf.kobotoolbox.org",
  auth_mode = "token",
  asset_id
)
```

## Arguments

- base_url:

  KoBo Toolbox URL. Default is <https://kf.kobotoolbox.org>.

- auth_mode:

  Password or token? Default is token.

- asset_id:

  Unique asset identifier.

## Value

A tibble of datasets available to specific user.

## Examples

``` r
kobo_auth_token(token = Sys.getenv("KOBO_TOKEN"))
kobo_get_data(asset_id = "aKJTpKiVUcPYim2epKkPvW")
#> # A tibble: 1 × 1
#>   x           
#>   <named list>
#> 1 <chr [1]>   
```
