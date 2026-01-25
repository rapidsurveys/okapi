# Retrieve list of assets available to specific user

Retrieve list of assets available to specific user

## Usage

``` r
kobo_list_assets(base_url = "https://kf.kobotoolbox.org", auth_mode = "token")
```

## Arguments

- base_url:

  KoBo Toolbox URL. Default is <https://kf.kobotoolbox.org>.

- auth_mode:

  Password or token? Default is token.

## Value

A list of assets available to specific user.

## Examples

``` r
kobo_auth_token(token = Sys.getenv("KOBO_TOKEN"))
kobo_list_assets()
#> # A tibble: 0 × 0
```
