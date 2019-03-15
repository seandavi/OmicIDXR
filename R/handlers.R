#' raw result handler
#'
#' A handler for OmicIDXGraphqlClient results that simply returns
#' the JSON results from a query as an R list.
#'
#' @importFrom jsonlite fromJSON
#'
#' @param res The character(1) vector returned by OmicIDXGraphqlClient$exec()
#'
#' @export
raw_handler = function(res) {
  return(jsonlite::fromJSON(res))
}

#' dataframe result handler
#'
#' A handler for OmicIDXGraphqlClient results that returns a
#' "maximally simplified" version of the data themselves, usually
#' as a possibly nested data frame.
#'
#' @importFrom jsonlite fromJSON
#'
#' @param res The character(1) vector returned by OmicIDXGraphqlClient$exec()
#'
#' @export
dataframe_handler = function(res) {
  return(jsonlite::fromJSON(res, simplifyDataFrame = TRUE, flatten=TRUE)$data[[1]]$edges)
}
