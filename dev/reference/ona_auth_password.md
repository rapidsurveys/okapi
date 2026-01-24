# Basic authentication to ONA with a username and password

Basic authentication to ONA with a username and password

## Usage

``` r
ona_auth_password(username, password = askpass::askpass())
```

## Arguments

- username:

  ONA username.

- password:

  ONA password. Default is an interactive input of password.

## Value

System environment variables for ONA_USERNAME and ONA_PASSWORD

## Examples

``` r
ona_auth_password(username = Sys.getenv("ONA_USERNAME"),
                  password = Sys.getenv("ONA_PASSWORD"))
```
