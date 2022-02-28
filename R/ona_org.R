################################################################################
#
#'
#' Register an organisation
#'
#' @param base_url ONA URL. Default is \url{https://api.ona.io}.
#' @param auth_mode Password or token? Default is token.
#' @param org Organisation short name or username.
#' @param name Organisation full name. If NULL (default), short name is used.
#'
#' @return Invisible. Organisation registered and created in ONA account
#'
#' @examples
#' ona_org_register(org = "okapi_organisation")
#'
#' @export
#'
#
################################################################################

ona_org_register <- function(base_url = "https://api.ona.io",
                             auth_mode = c("token", "password"),
                             org, name = NULL) {
  ## Get authentication mode
  auth_mode <- match.arg(auth_mode)

  ## Configure authentication/headers
  config <- ona_configure(auth_mode = auth_mode)

  ## Create name of project
  if (is.null(name)) {
    name <- org
  }

  ## Create body to POST
  .body <- list(
    org = org,
    name = name
  )

  ## Apply POST
  response <- httr::POST(
    url = base_url,
    path = "api/v1/orgs",
    body = .body,
    config = config
  )

  ## Read JSON response
  x <- jsonlite::fromJSON(
    txt = httr::content(x = response, as = "text", encoding = "UTF-8")
  )

  ## Return
  x
}



################################################################################
#
#'
#' List organisations
#'
#' @param base_url ONA URL. Default is \url{https://api.ona.io}.
#' @param auth_mode Password or token? Default is token.
#'
#' @return A tibble of organisations.
#'
#' @examples
#' ona_org_list()
#'
#' @export
#'
#'
#
################################################################################

ona_org_list <- function(base_url = "https://api.ona.io",
                         auth_mode = c("token", "password")) {
  ## Get authentication mode
  auth_mode <- match.arg(auth_mode)

  ## Configure authentication/headers
  config <- ona_configure(auth_mode = auth_mode)

  ## Apply GET
  response <- httr::GET(
    url = base_url,
    path = "api/v1/orgs",
    config = config
  )

  ## Read JSON
  x <- jsonlite::fromJSON(
    txt = httr::content(x = response, as = "text", encoding = "UTF-8")
  )

  ## Convert output to tibble
  x <- tibble::tibble(x)

  ## Return output
  x
}



################################################################################
#
#'
#' Delete registered organisation
#'
#' @param base_url ONA URL. Default is \url{https://api.ona.io}.
#' @param auth_mode Password or token? Default is token.
#' @param org Organisation short name or username.
#'
#' @return Delete specified organisation from specific ONA account.
#'
#' @examples
#' org_list <- ona_org_list()
#' org_name <- org_list[["org"]]
#' ona_org_delete(org = org_name)
#'
#' @export
#'
#
################################################################################

ona_org_delete <- function(base_url = "https://api.ona.io",
                           auth_mode = c("token", "password"),
                           org) {
  ##
  auth_mode <- match.arg(auth_mode)

  ## Configure authentication/headers
  config <- ona_configure(auth_mode = auth_mode)

  ## Apply DELETE
  httr::DELETE(
    url = base_url,
    config = config,
    path = paste("api/v1/orgs", org, sep = "/"),
    body = NULL
  )
}
