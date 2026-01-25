# Delete registered project

Delete registered project

## Usage

``` r
ona_project_delete(
  base_url = "https://api.ona.io",
  auth_mode = c("token", "password"),
  project_id = NULL
)
```

## Arguments

- base_url:

  ONA URL. Default is <https://api.ona.io>.

- auth_mode:

  Password or token? Default is token.

- project_id:

  Project identifier.

## Value

Delete specified project from specific ONA account.

## Examples

``` r
project_list <- ona_project_list()
project_id <- project_list[["projectid"]]
ona_project_delete(project_id = project_id)
#> Response [https://api.ona.io/api/v1/projects/]
#>   Date: 2026-01-25 23:36
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
