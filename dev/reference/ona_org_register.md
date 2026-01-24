# Register an organisation

Register an organisation

## Usage

``` r
ona_org_register(
  base_url = "https://api.ona.io",
  auth_mode = c("token", "password"),
  org,
  name = NULL
)
```

## Arguments

- base_url:

  ONA URL. Default is <https://api.ona.io>.

- auth_mode:

  Password or token? Default is token.

- org:

  Organisation short name or username.

- name:

  Organisation full name. If NULL (default), short name is used.

## Value

Invisible. Organisation registered and created in ONA account

## Examples

``` r
ona_org_register(org = "okapi_organisation")
#> $detail
#> [1] "Invalid token header. No credentials provided."
#> 
```
