################################################################################
#
#'
#' Register a project
#'
#' @param base_url ONA URL. Default is \url{https://api.ona.io}.
#' @param auth_mode Password or token? Default is token.
#' @param owner Username or organisation name creating the project. Default to
#'   username of currently authenticated account
#'   (via `Sys.getenv(ONA_USERNAME)`). If organisation name, should be
#'   an organisation to which currently authenticated account is the owner or
#'   admin user.
#' @param name Name of the project. If NULL (default), project is given a
#'   default name similar to that created by ONA for forms published without
#'   a project
#' @param public Logical. Should the project be public? Default to TRUE.
#'
#' @return Invisible. Project registered and created in ONA account
#'
#' @examples
#' ona_project_register()
#'
#' @export
#'
#'
#
################################################################################

ona_project_register <- function(base_url = "https://api.ona.io",
                                 auth_mode = c("token", "password"),
                                 owner = Sys.getenv("ONA_USERNAME"),
                                 name = NULL,
                                 public = TRUE) {
  ## Get authentication mode
  auth_mode <- match.arg(auth_mode)

  ## Configure authentication/headers
  config <- ona_configure(auth_mode = auth_mode)

  ## Create name of project
  if (is.null(name)) {
    name <- paste0(owner, "'s Project")
  }

  ## Check if name is already used in ONA account
  project_list <- ona_project_list()

  if (name %in% project_list[["name"]]) {
    warning(
      paste(
        strwrap(
          x = c("Specified project name already in use in the ", owner,
                " ONA account. Try a different project name."),
          width = 80,
        ),
        collapse = " "
      )
    )
  }

  ## Create body to POST
  .body <- list(
    owner = paste(base_url, "api/v1/users", owner, sep = "/"),
    name = name,
    public = public
  )

  ## Apply POST
  response <- httr::POST(
    url = base_url,
    path = "api/v1/projects",
    body = .body,
    config = config
  )

  # ## Process and check response
  # if (response[["status_code"]] == 201) {
  #   message(
  #     paste(
  #       strwrap(
  #         x = c("The project ",
  #               name, "
  #               has successfully been registered in the ",
  #               owner,
  #               " ONA account."),
  #         width = 80
  #       ),
  #       collapse = " "
  #     )
  #   )
  #
  #   x <- jsonlite::fromJSON(
  #     txt = httr::content(x = resp, as = "text", encoding = "UTF-8")
  #   )
  # }
  #
  # if (response[["status"]] == 400) {
  #   message(
  #     paste(
  #       strwrap(
  #         x = c(
  #           "There is an error in the request to register a new project in the ",
  #           owner, " ONA account. Please check your registration request."),
  #         width = 80
  #       ),
  #       collapse = " "
  #     )
  #   )
  # }

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
#' List projects
#'
#' @param base_url ONA URL. Default is \url{https://api.ona.io}.
#' @param auth_mode Password or token? Default is token.
#'
#' @return A tibble of projects.
#'
#' @examples
#' ona_project_list()
#'
#' @export
#'
#'
#
################################################################################

ona_project_list <- function(base_url = "https://api.ona.io",
                             auth_mode = c("token", "password")) {
  ## Get authentication mode
  auth_mode <- match.arg(auth_mode)

  ## Configure authentication/headers
  config <- ona_configure(auth_mode = auth_mode)

  ## Apply GET
  response <- httr::GET(
    url = base_url,
    path = "api/v1/projects",
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
#' Get project info
#'
#' @param base_url ONA URL. Default is \url{https://api.ona.io}.
#' @param auth_mode Password or token? Default is token.
#' @param project_id Project identifier.
#'
#' @return A tibble of projects.
#'
#' @examples
#' ona_project_info(project_id = 12345)
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
  response <- httr::GET(
    url = base_url,
    path = paste("api/v1/projects", project_id, sep = "/"),
    config = config)

  ## Read JSON
  x <- jsonlite::fromJSON(
    txt = httr::content(x = response, as = "text", encoding = "UTF-8")
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
#' ona_project_share(
#'   project_id = 12345,
#'   username = "validtrial",
#'   role = "readonly"
#'  )
#'
#' @export
#'
#'
#
################################################################################

ona_project_share <- function(base_url = "https://api.ona.io",
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
    response <- httr::PUT(
      url = base_url,
      path = paste("api/v1/projects", project_id, "share", sep = "/"),
      config = config,
      body = list(username = username, role = role),
      encoding = "json"
    )
  } else {
    response <- httr::PUT(
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


################################################################################
#
#'
#' Delete registered project
#'
#' @param base_url ONA URL. Default is \url{https://api.ona.io}.
#' @param auth_mode Password or token? Default is token.
#' @param project_id Project identifier.
#'
#' @return Delete specified project from specific ONA account.
#'
#' @examples
#' project_list <- ona_project_list()
#' project_id <- project_list[["projectid"]]
#' ona_project_delete(project_id = project_id)
#'
#' @export
#'
#
################################################################################

ona_project_delete <- function(base_url = "https://api.ona.io",
                               auth_mode = c("token", "password"),
                               project_id = NULL) {
  ##
  auth_mode <- match.arg(auth_mode)

  ## Configure authentication/headers
  config <- ona_configure(auth_mode = auth_mode)

  ## Apply DELETE
  httr::DELETE(
    url = base_url,
    config = config,
    path = paste("api/v1/projects", project_id, sep = "/"),
    body = NULL
  )
}

