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

[GraphQL] is a query language for APIs and a runtime for fulfilling those queries with existing data.
GraphQL provides a complete and understandable description of the data in the API, gives clients
the power to ask for exactly what they need and nothing more, makes it easier to evolve APIs over time,
and enables powerful developer tools.

GraphQL has only a *single url*, called the endpoint, which allows access to all data in the
API. GraphQL is also a *query language*. It is the GraphQL query that is submitted to the GraphQL
endpoint that results in data being returned.


[GraphQL]: https://graphql.org/

## What is a GraphQL query?

A GraphQL query looks a bit like JSON, except without quotes or commas. Here is an example
GraphQL query for a fictitious GraphQL API.

```
{
  allCharacters {
    name
  }
}
```

If we had a server that contained Star Wars trivia, the response from the server might look like:

```
{ "data": {
    "allCharacters": [
      {
        "name":"Luke"
      },
      {
        "name": "Darth"
      },
      ...
    ]
  }
}
```

If we changed the query to:

```
{
  allCharacters {
    name
    mass
  }
}
```

the response would now look like:

```
{ "data": {
    "allCharacters": [
      {
        "name":"Luke",
        "mass": 80
      },
      {
        "name": "Darth",
        "mass": 140
      },
      ...
    ]
  }
}
```

## How do I know what is in the GraphQL endpoint?

The GraphQL **schema** describes the data model(s) contained in the GraphQL endpoint. GraphQL is
strongly typed, has the concept of relationships between data types, and is self-documenting.
In fact, one can use the GraphQL endpoint to discover what is in the endpoint. I will not go
into the details right now, but this *introspection* capability makes possible some powerful
tooling. One of the most ubiguitous is the so-called **Graph*i*QL** (note the *i* in the name)
tool.

# Play with OmicIDX Graphql

Navigate to [Graph*i*QL] and follow along with the video (no sound).[^urlchange]

[^urlchange]: The urls in this document *are subject to change*.

<iframe width="560" height="315" src="https://www.youtube.com/embed/1Zg_Fbt56kc" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

[Graph*i*QL]: http://graphql-omicidx.cancerdatasci.org/graphiql

# Querying OmicIDX programmatically

GraphQL is quite easy to work with programmatically. All queries are made via a post request to the GraphQL endpoint. The POST request needs to be JSON encoded and must include the `"query"` key. A simple example of
the JSON for a basic query might look like:

```
{ "query": "{ heros { name weight } }"}
```

Note that the query string (ie., `"{ heros { name weight } }"`) is just a string. It is not formated as JSON itself.

- Current OmicIDX GraphQL endpoint[^urlchange]: http://graphql-omicidx.cancerdatasci.org/graphql

For example, let us get the first 500 SRA studies (500 is a limit to the number of results that we can retrieve in one go.
The GraphQL might look like this:

```
{
  allSraStudies {
    edges {
      node {
        accession
        title
        abstract
      }
    }
  }
}
```

You know that you can copy this query into the Graph*i*QL browser and get results. How about using [curl](https://curl.haxx.se/)? Note that I am doing some gymnastics below to make this work in one
command line. In practice, one would probably save the GraphQL query as a file (in json format) and then
post that file[^curlnote].

[^curlnote]: *For examples of how to post JSON using curl, see [this stackoverflow post](https://stackoverflow.com/questions/7172784/how-to-post-json-data-with-curl-from-terminal-commandline-to-test-spring-rest?rq=1)

```{bash}
curl --silent \
  -X POST \
  -H "Content-Type: application/json" \
  http://graphql-omicidx.cancerdatasci.org/graphql \
  --data @- << EOF

  { "query":"{
  allSraStudies(first: 1) {
    edges {
      node {
        accession
        title
        abstract
      }
    }
  }
}"
}
 EOF
```

Note that the return value is simply JSON. All our normal tools for working with JSON are available to us
to process and manipulate the results.
