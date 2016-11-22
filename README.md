Epicodus Final Individual Project: Rails Code Review - authentication, Ajax, APIs

#### This app is a travel log where users can come to see general information about travel destinations other registered users have added. Non-registered users can sign up to be able to add/edit/delete entries of their own. Logged in users can add/edit/delete items they have created.

#### By James Turello

### Software required to run this app
 * Rails 5.0.0.1
 * Postgres 9.5.0

## Setup/Installation Instructions/Requirements
 * Clone the git repository
 * cd into the project directory in a terminal window
 * Run the `bundle` command
 * Create/prepare the database - in a terminal window in the project directory:
   * `rails db:create`, `rails db:migrate`, `rails db:test:prepare`

## Setup Darksky API (for forecast info)
 * Sign up for a Dark Sky API account/key at this link `https://darksky.net/dev/` (allows 1000 free forecasts per day)
 * Save your API key as follows in a .env file in the project directory:
   * `DARKSKY_API_KEY=<api-key goes here>`

## Start app
 * Start database server (Postgres) - enter command `pg_ctl start` in the terminal window (main project directory)
 * Start the rails server - enter command `rails s` from the main project directory
 * Enter `localhost:3000` in your browser address bar to run the app

## Known Bugs/Issues

No known issues.

## Technologies Used

Rails 5.0.0.1, Postgres 9.5.0, tested on Chrome 52.0.2743.116 (64-bit)(Mac)

### License

This software is available for use under the MIT license.

Copyright (c) 2016 - James Turello
