% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/kobo_authentication.R
\name{kobo_list_assets}
\alias{kobo_list_assets}
\title{Retrieve list of assets available to specific user}
\usage{
kobo_list_assets(base_url = "https://kf.kobotoolbox.org", auth_mode = "token")
}
\arguments{
\item{base_url}{KoBo Toolbox URL. Default is \url{https://kf.kobotoolbox.org}.}

\item{auth_mode}{Password or token? Default is token.}
}
\value{
A list of assets available to specific user.
}
\description{
Retrieve list of assets available to specific user
}
\examples{
kobo_auth_token(token = Sys.getenv("KOBO_TOKEN"))
kobo_list_assets()

}
