Epicodus Final Individual Project: Rails Code Review - authentication, Ajax, APIs

#### This app is a travel log where users can come to see general information about travel destinations other registered users have added. Non-registered users can sign up to be able to add/edit/delete entries of their own. Logged in users can add/edit/delete items they have created.

#### By James Turello

### Software required to run this app
 * Ruby 2.3.1p112
 * Rails 5.0.0.1
 * Postgres 9.6.3

## Setup/Installation Instructions/Requirements
 * From a terminal window:
   * git clone https://github.com/jturello/rails-travel-log
   * cd rails-travel-log
   * `bundle`
   * Database setup:
     * Run command (in a 2nd terminal window/project root): `pg_ctl start`
     * Run command (back in the original terminal window): `rails db:create db:migrate db:test:prepare`

## Setup Darksky API (for forecast info)
 * Sign up for a Dark Sky API account/key here: [Darksky Api Keys](https://darksky.net/dev/)
 * Save API key in file .env in the project directory:
   * `DARKSKY_API_KEY=api-key-goes-here`

## Start app

 * From the project root directory run command: `rails s`
 * Visit app at  `localhost:3000`

## Running RSpec tests
 * Ajax tests in the test suite require the poltergeist gem which requires phantomjs to be installed on the host system [installation instructions](https://github.com/teampoltergeist/poltergeist#installing-phantomjs)
 * To run tests: 
   * in a terminal window cd into the project directory: `cd rails-travel-log`
   * run command: `rspec`
 * To run tests with text output:
   * from the project directory run command: `rspec --format d`


## Known Bugs/Issues

No known issues.

## Technologies Used

Ruby 2.3.1p112, Rails 5.0.0.1, Postgres 9.6.3, tested on Chrome 52.0.2743.116 (64-bit)(Mac)

### License

This software is available for use under the MIT license.

Copyright (c) 2016 - James Turello
