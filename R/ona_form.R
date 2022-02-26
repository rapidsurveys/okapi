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
#' ona_list_forms()
#'
#' @export
#'
#'
#
################################################################################

ona_list_forms <- function(base_url = "https://api.ona.io",
                           auth_mode = c("token", "password")) {
  ## Get authentication mode
  auth_mode <- match.arg(auth_mode)

  ## Configure authentication/headers
  config <- ona_configure(auth_mode = auth_mode)

  ## Apply GET
  resp <- httr::GET(url = base_url, path = "api/v1/forms", config = config)

  ## Read JSON
  x <- jsonlite::fromJSON(
    txt = httr::content(x = resp, as = "text", encoding = "UTF-8")
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
#'
#' @return A published form on ONA.
#'
#' @examples
#' ona_publish_form(
#'   xls_file = system.file(
#'     "appearance_widgets.xlsx", package = "okapi"
#'   )
#' )
#'
#' @export
#'
#'
#
################################################################################

ona_publish_form <- function(base_url = "https://api.ona.io",
                             auth_mode = c("token", "password"),
                             xls_file = NULL,
                             xls_url = NULL,
                             dropbox_xls_url = NULL) {
  ##
  auth_mode <- match.arg(auth_mode)

  ## Configure authentication/headers
  config <- ona_configure(auth_mode = auth_mode)

  ## Create body
  if (!is.null(xls_file)) {
    x <- httr::upload_file(xls_file)
    .body <- list(xls_file = x)
  } else {
    if (!is.null(xls_url) & is.null(dropbox_xls_url)) {
      .body <- list(xls_url = xls_url)
    } else {
      .body <- list(dropbox_xls_url = dropbox_xls_url)
    }
  }

  ## Apply POST
  httr::POST(
    url = base_url,
    config = config,
    path = "api/v1/forms",
    body = .body
  )
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
#' ona_delete_form(form_id = 647324)
#'
#' @export
#'
#'
#
################################################################################

ona_delete_form <- function(base_url = "https://api.ona.io",
                            auth_mode = c("token", "password"),
                            form_id) {
  ##
  auth_mode <- match.arg(auth_mode)

  ## Configure authentication/headers
  config <- ona_configure(auth_mode = auth_mode)

  ## Apply DELETE
  httr::DELETE(
    url = base_url,
    config = config,
    path = paste("api/v1/forms", form_id, sep = "/"),
    body = FALSE
  )
}
