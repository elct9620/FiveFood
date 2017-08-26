FiveFood
===

## Requirements

* Ruby 2.4+
* Node 8.0+
* PostgreSQL 9.6
* Yarn

## Usage

> TODO

## Development

Get the repository

```sh
$ git clone git@github.com:elct9620/FiveFood.git
```

### Setup

```sh
$ bin/setup
```


### Running

In development, you'll need to run `bin/rails server` with `bin/webpack-dev-server` to have the `app/javascript/packs/*.js` files be compiled as you make changes, and `bin/relay-compiler` if you change the GraphQL schema or any `graphql` tags in any JavaScript files.

If you'd rather not have to run the two processes separately by hand, you can use [Foreman](https://ddollar.github.io/foreman/):

```sh
$ bin/foreman start
```

The default port of the Rails Server is `5000`.
