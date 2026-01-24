# Basic authentication to KoBo Toolbox with a username and password

Basic authentication to KoBo Toolbox with a username and password

## Usage

``` r
kobo_auth_password(username, password = askpass::askpass())
```

## Arguments

- username:

  KoBo Toolbox username.

- password:

  KoBo Toolbox password. Default is an interactive input of password.

## Value

System environment variables for KOBO_KF_USERNAME and KOBO_KF_PASSWORD

## Examples

``` r
kobo_auth_password(username = Sys.getenv("KOBO_USERNAME"),
                   password = Sys.getenv("KOBO_PASSWORD"))
```
