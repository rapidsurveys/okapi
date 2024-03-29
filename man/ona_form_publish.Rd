% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ona_form.R
\name{ona_form_publish}
\alias{ona_form_publish}
\title{Publish XLSForm}
\usage{
ona_form_publish(
  base_url = "https://api.ona.io",
  auth_mode = c("token", "password"),
  xls_file = NULL,
  xls_url = NULL,
  dropbox_xls_url = NULL,
  project_id = NULL,
  public = FALSE
)
}
\arguments{
\item{base_url}{ONA URL. Default is \url{https://api.ona.io}.}

\item{auth_mode}{Password or token? Default is token.}

\item{xls_file}{Path to the XLSForm file.}

\item{xls_url}{URL to the XLSForm file.}

\item{dropbox_xls_url}{Dropbox URL to the XLSForm file.}

\item{project_id}{Project identifier of project to publish XLSForm to.
If NULL (default), XLSForm is published to the an account's default
project.}

\item{public}{Logical. Should the form be public? Default to FALSE.}
}
\value{
A published form on ONA.
}
\description{
Publish XLSForm
}
\examples{
project_list <- ona_project_list()
if ("test" \%in\% project_list$name) {
  project_id = project_list$id[project_list$name == "test"]
  ona_project_delete(project_id = project_id)
}
ona_project_register(name = "test")
project_list <- ona_project_list()
project_id = project_list$id[project_list$name == "test"]
ona_form_publish(
  xls_file = system.file(
    "appearance_widgets.xlsx", package = "okapi"
  ),
  project_id = project_id
)

}
