################################################################################
#
#'
#' Configure HTTP headers
#'
#' @param auth_mode Password or token? Default is token.
#'
#' @return An object of class request for HTTP requests
#'
#
################################################################################

ona_configure <- function(auth_mode = c("token", "password")) {
  ##
  auth_mode <- match.arg(auth_mode)

  ##
  if (auth_mode == "password") {
    config <- httr::authenticate(
      user = Sys.getenv(x = "ONA_USERNAME"),
      password = Sys.getenv(x = "ONA_PASSWORD")
    )
  } else {
    config <- httr::add_headers(
      "Authorization" = paste("Token", Sys.getenv(x = "ONA_TOKEN"), sep = " ")
    )
  }
}
