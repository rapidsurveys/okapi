################################################################################
#
#'
#' Retrieve list of datasets available to specific user
#'
#' @param base_url ONA URL. Default is \url{https://api.ona.io}.
#' @param auth_mode Password or token? Default is token.
#'
#' @return A tibble of datasets available to specific user.
#'
#' @examples
#' ona_list_data()
#'
#' @export
#'
#'
#
################################################################################

ona_list_data <- function(base_url = "https://api.ona.io",
                          auth_mode = c("token", "password")) {
  ## Get authentication mode
  auth_mode <- match.arg(auth_mode)

  ## Configure authentication/headers
  config <- ona_configure(auth_mode = auth_mode)

  ## Apply GET
  resp <- httr::GET(url = base_url, path = "api/v1/data", config = config)

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
#' Retrieve specific dataset by form ID from specific user
#'
#' @param base_url ONA URL. Default is \url{https://api.ona.io}.
#' @param auth_mode Password or token? Default is token.
#' @param form_id Form identifier.
#'
#' @return A tibble of retrieved dataset.
#'
#' @examples
#' ona_get_data(form_id = 276175)
#'
#' @export
#'
#'
#
################################################################################

ona_get_data <- function(base_url = "https://api.ona.io",
                         auth_mode = c("token", "password"),
                         form_id) {
  ## Get authentication mode
  auth_mode <- match.arg(auth_mode)

  ## Configure authentication/headers
  config <- ona_configure(auth_mode = auth_mode)

  ## Apply GET
  resp <- httr::GET(
    url = base_url,
    path = paste("api/v1/data", form_id, sep = "/"), config = config
  )

  ## Read JSON
  x <- jsonlite::fromJSON(
    txt = httr::content(x = resp, as = "text", encoding = "UTF-8")
  )

  ## Convert output to tibble
  x <- tibble::tibble(x)

  ## Return output
  x
}

