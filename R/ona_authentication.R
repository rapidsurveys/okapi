################################################################################
#
#'
#' Basic authentication to ONA with a username and password
#'
#' @param username ONA username.
#' @param password ONA password. Default is an interactive input of password.
#'
#' @return System environment variables for ONA_USERNAME and ONA_PASSWORD
#'
#' @examples
#' ona_auth_password(username = Sys.getenv("ONA_USERNAME"),
#'                   password = Sys.getenv("ONA_PASSWORD"))
#'
#' @export
#'
#
################################################################################

ona_auth_password <- function(username,
                              password = askpass::askpass()) {
  Sys.setenv("ONA_USERNAME" = username,
             "ONA_PASSWORD" = password)
}


################################################################################
#
#'
#' Basic authentication to ONA with API authentication token
#'
#' @param token ONA API authentication token.
#'
#' @return System environment variables for ONA_TOKEN
#'
#' @examples
#' ona_auth_token(token = Sys.getenv("ONA_TOKEN"))
#'
#' @export
#'
#'
#
################################################################################

ona_auth_token <- function(token) {
  Sys.setenv("ONA_TOKEN" = token)
}
