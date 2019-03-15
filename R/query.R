#' A container for OmicIDXR queries
#'
#'
#' @importFrom ghql Query
#'
#' @export
OmicIDXQuery <- R6::R6Class(
  "OmicIDXQuery",
  inherit = ghql::Query
)
