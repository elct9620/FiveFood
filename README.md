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

```
$ git clone git@github.com:elct9620/FiveFood.git
```

Install dependencies

```
$ bundle install
```

Prepare for javascript

```
$ yarn
```

Setup database

```
# Run this taks if you didn't create database
$ rake db:create
```

```
$ rake db:migrate
```

Start Rails

```
$ rails s
```

Start Webpack Dev Server

```
$ ./bin/webpack-dev-server
```
