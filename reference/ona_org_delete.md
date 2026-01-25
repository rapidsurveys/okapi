# Delete registered organisation

Delete registered organisation

## Usage

``` r
ona_org_delete(
  base_url = "https://api.ona.io",
  auth_mode = c("token", "password"),
  org
)
```

## Arguments

- base_url:

  ONA URL. Default is <https://api.ona.io>.

- auth_mode:

  Password or token? Default is token.

- org:

  Organisation short name or username.

## Value

Delete specified organisation from specific ONA account.

## Examples

``` r
org_list <- ona_org_list()
org_name <- org_list[["org"]]
ona_org_delete(org = org_name)
#> Response [https://api.ona.io/api/v1/orgs/]
#>   Date: 2026-01-25 23:28
#>   Status: 404
#>   Content-Type: text/html; charset=utf-8
#>   Size: 4.58 kB
#> <!DOCTYPE html>
#> <html lang="en">
#>   <head>
#>     <meta charset="utf-8">
#>     <title>api.ona.io</title>
#>     <meta name="description" content="Mobile data collection made easy. formh...
#>     <meta name="author" content="">
#>     
#>     <meta name="google-site-verification" content="H0JRFrqLHnVfHuZaHRfz1Gmc5f...
#>     
#> ...
```
