#' A container for OmicIDXR queries
#'
#'
#' @importFrom ghql Query
#'
#'
#' @examples
#' # create a client
#' cli = OmicIDXGraphqlClient$new()
#'
#' # create a query container
#' qc = OmicIDXQuery$new()
#'
#' qc$query('allSraStudies', '
#' { allSraStudies
#'   {
#'     edges {
#'       node {
#'         accession
#'         bioproject
#'         gse
#'         title
#'         status
#'         updated
#'       }
#'     }
#'   }
#' }
#' ')
#'
#' results = dataframe_handler(cli$exec(qc$queries$allSraStudies))
#' dim(results)
#' head(results)
#'
#'
#' @export
OmicIDXQuery <- R6::R6Class(
  "OmicIDXQuery",
  inherit = ghql::Query
)
