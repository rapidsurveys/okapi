# Delete published form

Delete published form

## Usage

``` r
ona_form_delete(
  base_url = "https://api.ona.io",
  auth_mode = c("token", "password"),
  form_id = NULL
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

Delete specified form from ONA.

## Examples

``` r
form_list <- ona_form_list()
form_id <- form_list[["formid"]][form_list[["title"]] == "Appearance Widgets"]
ona_form_delete(form_id = form_id)
#> Response [https://api.ona.io/api/v1/forms/]
#>   Date: 2026-01-24 23:59
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
