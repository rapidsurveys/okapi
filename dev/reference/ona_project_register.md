# Register a project

Register a project

## Usage

``` r
ona_project_register(
  base_url = "https://api.ona.io",
  auth_mode = c("token", "password"),
  owner = Sys.getenv("ONA_USERNAME"),
  name = NULL,
  public = TRUE
)
```

## Arguments

- base_url:

  ONA URL. Default is <https://api.ona.io>.

- auth_mode:

  Password or token? Default is token.

- owner:

  Username or organisation name creating the project. Default to
  username of currently authenticated account (via
  `Sys.getenv(ONA_USERNAME)`). If organisation name, should be an
  organisation to which currently authenticated account is the owner or
  admin user.

- name:

  Name of the project. If NULL (default), project is given a default
  name similar to that created by ONA for forms published without a
  project

- public:

  Logical. Should the project be public? Default to TRUE.

## Value

Invisible. Project registered and created in ONA account

## Examples

``` r
ona_project_register()
#> $detail
#> [1] "Invalid token header. No credentials provided."
#> 
```
