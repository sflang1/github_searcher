# Github Searcher

This repository contains a example web page for searching public repositories through Github. It was built using the framework Ruby on Rails.

## The endpoint

This project queries the Github API. The endpoint used is:

`GET https://api.github.com/search/repositories`

The following parameters are used for the queries:

* The name of the repository
* Page number
* Number of records by page

<b>Limitation: </b> the Github API only allows to query the first 1000 records.

## Implementation

The code that takes care of querying the Github API is stored in a single class, located in `query_github_service.rb`, following the single responsibility design principle. It also makes easier and more efficient the process of automated testing, because the responses of the API can be mocked and in this case, it is not necessary to send a HTTP request to the Github API.

Regarding the view, a templating engine for Rails called Slim is used. This engine reduces a lot the boilerplate code that the default Rails templating engine (ERB) includes. The style library used is [materialize](https://github.com/materializecss/materialize).

The dashboard controller contains two actions, the `index` for rendering the view and the `search` that is called remotely, and that calls the service aforementioned. It uses Javascript for replacing the HTML content of the table with the results obtained from the API.

## Deployment

### Development

1. Copy the example environment file: `cp .env.example .env.development` and fill `DB_USERNAME` and `DB_PASSWORD` with the appropiate values.
2. `bundle install`
3. `yarn`
4. `rails server`
5. Navigate to `localhost:3000`

### Production

There is also a way to reproduce the code base with Docker. Just follow the next steps:

1. Copy the example environment file: `cp .env.production.example .env.production` and fill `DB_PASSWORD` with any value you want.
2. `docker-compose --env-file=.env.production up`
3. Navigate to `localhost:3000`
