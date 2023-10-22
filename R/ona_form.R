################################################################################
#
#'
#' List published forms
#'
#' @param base_url ONA URL. Default is \url{https://api.ona.io}.
#' @param auth_mode Password or token? Default is token.
#'
#' @return A tibble of published forms.
#'
#' @examples
#' ona_form_list()
#'
#' @export
#'
#'
#
################################################################################

ona_form_list <- function(base_url = "https://api.ona.io",
                          auth_mode = c("token", "password")) {
  ## Get authentication mode
  auth_mode <- match.arg(auth_mode)

  ## Configure authentication/headers
  config <- ona_configure(auth_mode = auth_mode)

  ## Apply GET
  resp <- httr::GET(url = base_url, path = "api/v1/forms", config = config)

  ## Read JSON
  x <- jsonlite::fromJSON(
    txt = httr::content(x = resp, as = "text")
  )

  ## Convert output to tibble
  x <- tibble::tibble(x)

  ## Return output
  x
}


################################################################################
#
#'
#' Publish XLSForm
#'
#' @param base_url ONA URL. Default is \url{https://api.ona.io}.
#' @param auth_mode Password or token? Default is token.
#' @param xls_file Path to the XLSForm file.
#' @param xls_url URL to the XLSForm file.
#' @param dropbox_xls_url Dropbox URL to the XLSForm file.
#' @param project_id Project identifier of project to publish XLSForm to.
#'   If NULL (default), XLSForm is published to the an account's default
#'   project.
#' @param public Logical. Should the form be public? Default to FALSE.
#'
#' @return A published form on ONA.
#'
#' @examples
#' project_list <- ona_project_list()
#' if ("test" %in% project_list$name) {
#'   project_id = project_list$id[project_list$name == "test"]
#'   ona_project_delete(project_id = project_id)
#' }
#' ona_project_register(name = "test")
#' project_list <- ona_project_list()
#' project_id = project_list$id[project_list$name == "test"]
#' ona_form_publish(
#'   xls_file = system.file(
#'     "appearance_widgets.xlsx", package = "okapi"
#'   ),
#'   project_id = project_id
#' )
#'
#' @export
#'
#'
#
################################################################################

ona_form_publish <- function(base_url = "https://api.ona.io",
                             auth_mode = c("token", "password"),
                             xls_file = NULL,
                             xls_url = NULL,
                             dropbox_xls_url = NULL,
                             project_id = NULL,
                             public = FALSE) {
  ##
  auth_mode <- match.arg(auth_mode)

  ## Configure authentication/headers
  config <- ona_configure(auth_mode = auth_mode)

  ## Create body
  if (!is.null(xls_file)) {
    x <- httr::upload_file(xls_file)
    .body <- list(xls_file = x, public = public)
  } else {
    if (!is.null(xls_url) & is.null(dropbox_xls_url)) {
      .body <- list(xls_url = xls_url, public = public)
    } else {
      .body <- list(dropbox_xls_url = dropbox_xls_url, public = public)
    }
  }

  ## Apply POST
  if (is.null(project_id)) {
    json <- httr::POST(
      url = base_url,
      config = config,
      path = "api/v1/forms",
      body = .body
    )
  } else {
    json <- httr::POST(
      url = base_url,
      config = config,
      path = paste("api/v1/projects", project_id, "forms", sep = "/"),
      body = .body
    )
  }

  ## Read json
  x <- jsonlite::fromJSON(
    txt = httr::content(x = json, as = "text", encoding = "UTF-8")
  )

  ## Return json content
  x
}


################################################################################
#
#'
#' Delete published form
#'
#' @param base_url ONA URL. Default is \url{https://api.ona.io}.
#' @param auth_mode Password or token? Default is token.
#' @param form_id Form identifier.
#'
#' @return Delete specified form from ONA.
#'
#' @examples
#' form_list <- ona_form_list()
#' form_id <- form_list[["formid"]][form_list[["title"]] == "Appearance Widgets"]
#' ona_form_delete(form_id = form_id)
#'
#' @export
#'
#'
#
################################################################################

ona_form_delete <- function(base_url = "https://api.ona.io",
                            auth_mode = c("token", "password"),
                            form_id = NULL) {
  ##
  auth_mode <- match.arg(auth_mode)

  ## Configure authentication/headers
  config <- ona_configure(auth_mode = auth_mode)

  ## Apply DELETE
  httr::DELETE(
    url = base_url,
    config = config,
    path = paste("api/v1/forms", form_id, sep = "/"),
    body = NULL
  )
}
