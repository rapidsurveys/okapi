# Basic authentication to KoBo Toolbox with API authentication token

Basic authentication to KoBo Toolbox with API authentication token

## Usage

``` r
kobo_auth_token(token)
```

## Arguments

- token:

  KoBo Toolbox API authentication token.

## Value

System environment variables for KOBO_KF_TOKEN

## Examples

``` r
kobo_auth_token(token = Sys.getenv("KOBO_TOKEN"))
```
