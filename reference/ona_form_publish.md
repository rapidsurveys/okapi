# Publish XLSForm

Publish XLSForm

## Usage

``` r
ona_form_publish(
  base_url = "https://api.ona.io",
  auth_mode = c("token", "password"),
  xls_file = NULL,
  xls_url = NULL,
  dropbox_xls_url = NULL,
  project_id = NULL,
  public = FALSE
)
```

## Arguments

- base_url:

  ONA URL. Default is <https://api.ona.io>.

- auth_mode:

  Password or token? Default is token.

- xls_file:

  Path to the XLSForm file.

- xls_url:

  URL to the XLSForm file.

- dropbox_xls_url:

  Dropbox URL to the XLSForm file.

- project_id:

  Project identifier of project to publish XLSForm to. If NULL
  (default), XLSForm is published to the an account's default project.

- public:

  Logical. Should the form be public? Default to FALSE.

## Value

A published form on ONA.

## Examples

``` r
project_list <- ona_project_list()
if ("test" %in% project_list$name) {
  project_id = project_list$id[project_list$name == "test"]
  ona_project_delete(project_id = project_id)
}
#> Warning: Unknown or uninitialised column: `name`.
ona_project_register(name = "test")
#> $detail
#> [1] "Invalid token header. No credentials provided."
#> 
project_list <- ona_project_list()
project_id = project_list$id[project_list$name == "test"]
#> Warning: Unknown or uninitialised column: `id`.
#> Warning: Unknown or uninitialised column: `name`.
ona_form_publish(
  xls_file = system.file(
    "appearance_widgets.xlsx", package = "okapi"
  ),
  project_id = project_id
)
#> $detail
#> [1] "Invalid token header. No credentials provided."
#> 
```
