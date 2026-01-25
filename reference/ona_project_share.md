# Share projects with user(s)

Share projects with user(s)

## Usage

``` r
ona_project_share(
  base_url = "https://api.ona.io",
  auth_mode = c("token", "password"),
  project_id = NULL,
  username = NULL,
  role = c("readonly", "dataentry", "editor", "manager"),
  email = NULL
)
```

## Arguments

- base_url:

  ONA URL. Default is <https://api.ona.io>.

- auth_mode:

  Password or token? Default is token.

- project_id:

  Project identifier.

- username:

  A character value or vector of username/s of user/s to share a form
  with.

- role:

  A character value for the role the user/s will have on the project.
  This can be *readonly*, *dataentry*, *editor*, or *manager*.

- email:

  Email message to send to user/s to whom project has been shared with.
  If NULL (default), user/s will not be notified.

## Value

Invisible. Project shared with specified users with specified roles. A
tibble of project information.

## Examples

``` r
ona_project_share(
  project_id = 12345,
  username = "validtrial",
  role = "readonly"
 )
#> # A tibble: 1 × 2
#>   forms  users 
#>   <list> <list>
#> 1 <NULL> <NULL>
```
