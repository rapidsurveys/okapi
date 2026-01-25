# Basic authentication to ONA with API authentication token

Basic authentication to ONA with API authentication token

## Usage

``` r
ona_auth_token(token)
```

## Arguments

- token:

  ONA API authentication token.

## Value

System environment variables for ONA_TOKEN

## Examples

``` r
ona_auth_token(token = Sys.getenv("ONA_TOKEN"))
```
