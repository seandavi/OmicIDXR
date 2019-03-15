#' An OmicIDX Graphql client
#'
#' The OmicIDXGraphqlClient is the entry point into the OmicIDX API. Its main function is to
#' perform calls out to the graphql API url and return results. Queries are constructed elsewhere
#' using the OmicIDXQuery class.
#'
#' @details
#' GraphQL is a query language for APIs and a runtime for fulfilling those queries with
#' existing data. GraphQL provides a complete and understandable description of the data in
#' the API, gives clients the power to ask for exactly what they need and nothing more, makes
#' it easier to evolve APIs over time, and enables powerful developer tools.
#'
#' GraphQL has only a *single url*, called the endpoint, which allows access to all data in the
#' API. GraphQL is also a *query language*. It is the GraphQL query that is submitted to the GraphQL
#' endpoint that results in data being returned.
#'
#' @importFrom ghql GraphqlClient
#' @export
OmicIDXGraphqlClient = R6::R6Class(
  "OmicIDXGraphqlClient",
  inherit = ghql::GraphqlClient,
  public = list(
    initialize = function(url = .omicidx_base, headers, gzip=TRUE) {
      if(gzip) {
        if (missing(headers)) headers = list('Accept-Encoding'= 'gzip')
        if (!missing(headers)) headers[['Accept-Encoding']]='gzip'
      }
      super$initialize(url, headers)
    },
    print = function(...) {
      cat('<OmicIDXGraphql client>', sep = "\n")
      cat(paste0('  endpoint url: ', self$url), sep="\n")
      if(!is.null(self$headers))
        cat('  headers: ', paste0('  - ',names(self$headers)), sep="\n")
    },
    ping = function() {
      message("The OmicIDX Graphql server does not support HEAD/ping requests")
    }
  )
)
