% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/client.R
\docType{data}
\name{OmicIDXGraphqlClient}
\alias{OmicIDXGraphqlClient}
\title{An OmicIDX Graphql client}
\format{An object of class \code{R6ClassGenerator} of length 24.}
\usage{
OmicIDXGraphqlClient
}
\description{
The OmicIDXGraphqlClient is the entry point into the OmicIDX API. Its main function is to
perform calls out to the graphql API url and return results. Queries are constructed elsewhere
using the OmicIDXQuery class.
}
\details{
GraphQL is a query language for APIs and a runtime for fulfilling those queries with
existing data. GraphQL provides a complete and understandable description of the data in
the API, gives clients the power to ask for exactly what they need and nothing more, makes
it easier to evolve APIs over time, and enables powerful developer tools.

GraphQL has only a *single url*, called the endpoint, which allows access to all data in the
API. GraphQL is also a *query language*. It is the GraphQL query that is submitted to the GraphQL
endpoint that results in data being returned.
}
\keyword{datasets}
