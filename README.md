## Mondo Kegbot API

Internal API to give insight into Mondo's beer consumption, tap status, and other fun metrics!

Some architecture based off of the [nodejs-api-starter project](https://github.com/kriasoft/nodejs-api-starter) by kriasoft. Some code was copied blatantly `¯\_(ツ)_/¯`

### Dependencies
Make sure the following are installed and up to date:

- [Node ~8.1](https://nodejs.org/en/)
- [Yarn](https://yarnpkg.com/en/)
- [Postgresql](https://postgresapp.com/) - easiest way to get up and going with PG. You can also install via homebrew.

### Local Setup
- A `.env-example` file is included in the repo. Create a `.env` file locally and change the values as necessary.
- Run `yarn install` to install all necessary dependencies.
- Run the `./config/pg-initdb.sh` command to initialize a new DB - Note: you might need to set permissions first (`chmod 755 ./config/pg-initdb.sh`)
- Run DB migrations (`yarn db-migrate`)

### Database Tasks
#### `yarn db-migration my_migration_name`
- Creates a new migration with the provided name prepended with a timestamp
#### `yarn db-migrate`
- Runs database migrations
#### `yarn db-rollback`
- Rollback the last migration
#### `yarn db-seed`
- Seeds the DB (TBI)


### Deploy Steps
TBI
