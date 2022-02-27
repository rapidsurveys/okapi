################################################################################
#
#'
#' List projects
#'
#' @param base_url ONA URL. Default is \url{https://api.ona.io}.
#' @param auth_mode Password or token? Default is token.
#'
#' @return A tibble of projects.
#'
#' @examples
#' ona_list_projects()
#'
#' @export
#'
#'
#
################################################################################

ona_list_projects <- function(base_url = "https://api.ona.io",
                              auth_mode = c("token", "password")) {
  ## Get authentication mode
  auth_mode <- match.arg(auth_mode)

  ## Configure authentication/headers
  config <- ona_configure(auth_mode = auth_mode)

  ## Apply GET
  resp <- httr::GET(
    url = base_url,
    path = "api/v1/projects",
    config = config
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


################################################################################
#
#'
#' Get project info
#'
#' @param base_url ONA URL. Default is \url{https://api.ona.io}.
#' @param auth_mode Password or token? Default is token.
#' @param project_id Project identifier.
#'
#' @return A tibble of projects.
#'
#' @examples
#' ona_project_info(project_id = 179619)
#'
#' @export
#'
#'
#
################################################################################

ona_project_info <- function(base_url = "https://api.ona.io",
                             auth_mode = c("token", "password"),
                             project_id = NULL) {
  ## Get authentication mode
  auth_mode <- match.arg(auth_mode)

  ## Configure authentication/headers
  config <- ona_configure(auth_mode = auth_mode)

  ## Apply GET
  resp <- httr::GET(
    url = base_url,
    path = paste("api/v1/projects", project_id, sep = "/"),
    config = config)

  ## Read JSON
  x <- jsonlite::fromJSON(
    txt = httr::content(x = resp, as = "text", encoding = "UTF-8")
  )

  ## Convert output to tibble
  #x <- tibble::tibble(x)

  ## Return output
  x
}


################################################################################
#
#'
#' Share projects with user(s)
#'
#' @param base_url ONA URL. Default is \url{https://api.ona.io}.
#' @param auth_mode Password or token? Default is token.
#' @param project_id Project identifier.
#' @param username A character value or vector of username/s of user/s to share
#'   a form with.
#' @param role A character value for the role the user/s will have on the
#'   project. This can be *readonly*, *dataentry*, *editor*, or *manager*.
#' @param email Email message to send to user/s to whom project has been
#'   shared with. If NULL (default), user/s will not be notified.
#'
#' @return Invisible. Project shared with specified users with specified
#'   roles. A tibble of project information.
#'
#' @examples
#' ona_share_project(
#'   project_id = 179619,
#'   username = "validtrial",
#'   role = "readonly"
#'  )
#'
#' @export
#'
#'
#
################################################################################

ona_share_project <- function(base_url = "https://api.ona.io",
                              auth_mode = c("token", "password"),
                              project_id = NULL,
                              username = NULL,
                              role = c("readonly", "dataentry",
                                       "editor", "manager"),
                              email = NULL) {
  ## Get authentication mode
  auth_mode <- match.arg(auth_mode)

  ## Configure authentication/headers
  config <- ona_configure(auth_mode = auth_mode)

  ## Get role
  role <- match.arg(role)

  ## Apply PUT
  if (is.null(email)) {
    httr::PUT(
      url = base_url,
      path = paste("api/v1/projects", project_id, "share", sep = "/"),
      config = config,
      body = list(username = username, role = role),
      encoding = "json"
    )
  } else {
    httr::PUT(
      url = base_url,
      path = paste("api/v1/projects", project_id, "share", sep = "/"),
      config = config,
      body = list(username = username, role = role, email_msg = email),
      encoding = "json"
    )
  }

  ## Get project info
  project_info <- ona_project_info(project_id = project_id)

  ## Create output
  x <- tibble::tibble(
    name = project_info$name,
    project_id = project_info$projectid,
    owner = project_info$owner,
    url = project_info$url,
    forms = list(project_info$forms$name),
    users = list(project_info$users$user)
  )

  ## Return output
  x
}
