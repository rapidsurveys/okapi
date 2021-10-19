################################################################################
#
#'
#' Basic authentication to KoBo Toolbox with a username and password
#'
#' @param username KoBo Toolbox username.
#' @param password KoBo Toolbox password. Default is an interactive input of
#'   password.
#'
#' @return System environment variables for KOBO_KF_USERNAME and KOBO_KF_PASSWORD
#'
#' @examples
#' kobo_auth_password(username = "ernestguevarra",
#'                    password = "apadana447*")
#'
#' @export
#'
#
################################################################################

kobo_auth_password <- function(username, password = askpass::askpass()) {
  Sys.setenv("KOBO_USERNAME" = username,
             "KOBO_PASSWORD" = password)
}


################################################################################
#
#'
#' Basic authentication to KoBo Toolbox with API authentication token
#'
#' @param token KoBo Toolbox API authentication token.
#'
#' @return System environment variables for KOBO_KF_TOKEN
#'
#' @examples
#' kobo_auth_token(token = "e9b39da128ff1b0bd4366b015c9e8ebad35b5fea")
#'
#' @export
#'
#'
#
################################################################################

kobo_auth_token <- function(token) {
  Sys.setenv("KOBO_TOKEN" = token)
}


################################################################################
#
#'
#' Retrieve list of assets available to specific user
#'
#' @param base_url KoBo Toolbox URL. Default is \url{https://kf.kobotoolbox.org}.
#' @param auth_mode Password or token? Default is token.
#'
#' @return A list of assets available to specific user.
#'
#' @examples
#' kobo_auth_token(token = "e9b39da128ff1b0bd4366b015c9e8ebad35b5fea")
#' kobo_list_assets()
#'
#' @export
#'
#'
#
################################################################################

kobo_list_assets <- function(base_url = "https://kf.kobotoolbox.org",
                             auth_mode = "token") {
  ##
  if (auth_mode == "password") {
    config <- httr::authenticate(user = Sys.getenv(x = "KOBO_USERNAME"),
                                 password = Sys.getenv(x = "KOBO_PASSWORD"))
  } else {
    config <- httr::add_headers("Authorization" = paste("Token",
                                                        Sys.getenv(x = "KOBO_TOKEN"),
                                                        sep = " "))
  }

  ##
  resp <- httr::GET(url = base_url,
                    path = "api/v2/assets/",
                    config = config)

  ##
  x <- jsonlite::fromJSON(txt = httr::content(x = resp,
                                              as = "text",
                                              encoding = "UTF-8"))

  ##
  x <- tibble::tibble(x$results)

  ##
  return(x)
}


################################################################################
#
#'
#' Retrieve specific dataset by form ID from specific user
#'
#' @param base_url KoBo Toolbox URL. Default is \url{https://kf.kobotoolbox.org}.
#' @param auth_mode Password or token? Default is token.
#' @param asset_id Unique asset identifier.
#'
#' @return A tibble of datasets available to specific user.
#'
#' @examples
#' kobo_auth_token(token = "e9b39da128ff1b0bd4366b015c9e8ebad35b5fea")
#' kobo_get_data(asset_id = "aKJTpKiVUcPYim2epKkPvW")
#'
#' @export
#'
#'
#
################################################################################

kobo_get_data <- function(base_url = "https://kf.kobotoolbox.org",
                          auth_mode = "token",
                          asset_id) {
  ##
  if (auth_mode == "password") {
    config <- httr::authenticate(user = Sys.getenv(x = "KOBO_USERNAME"),
                                 password = Sys.getenv(x = "KOBO_PASSWORD"))
  } else {
    config <- httr::add_headers("Authorization" = paste("Token",
                                                        Sys.getenv(x = "KOBO_TOKEN"),
                                                        sep = " "))
  }

  ##
  resp <- httr::GET(url = base_url,
                    path = paste("api/v2/assets", asset_id, "data/", sep = "/"),
                    config = config)

  ##
  x <- jsonlite::fromJSON(txt = httr::content(x = resp,
                                              as = "text",
                                              encoding = "UTF-8"))

  ##
  x <- tibble::tibble(x)

  ##
  return(x)
}
