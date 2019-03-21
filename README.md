# OmicIDXR

This package facilitates access to nearly complete metadata from the world's largest
genomics data repositories. Through bulk access to these metadata, we hope to:

- Ease bulk metadata processing, such as natural language processing or phenotype predicion
- Allow creation of custom collections of samples or experiments for secondary analysis or metaanalysis
- Support bulk reprocessing of genomics data
- Provide a platform for enhancing metadata
- Offer high-performance API access as well as bulk downloads of processed genomic metadata

# Introduction to the OmicIDX API

OmicIDX parses and then serves public genomics repository metadata. These metadata
are growing quickly, updated often, and are now very large when taken as a whole.
Because of the interrelated nature of the metadata and the myriad approaches and use cases that
exist, including search, bulk download, and even data mining, we serve the data via
a GraphQL endpoint.

Currently, OmicIDX contains the SRA and Biosample metadata sets. These overlap with
each other, but SRA metadata contains deeper metadata than Biosample data on the same
samples. Biosample, on the other hand, contains many more samples and currently includes metadata
about a subset of NCBI GEO, all SRA samples, and some additional samples from projects
like Genbank.

# GraphQL for accessing OmicIDX data

- See the vignette for details. 

[GraphQL] is a query language for APIs and a runtime for fulfilling those queries with existing data.
GraphQL provides a complete and understandable description of the data in the API, gives clients
the power to ask for exactly what they need and nothing more, makes it easier to evolve APIs over time,
and enables powerful developer tools.

GraphQL has only a *single url*, called the endpoint, which allows access to all data in the
API. GraphQL is also a *query language*. It is the GraphQL query that is submitted to the GraphQL
endpoint that results in data being returned.


[GraphQL]: https://graphql.org/
