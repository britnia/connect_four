# How to Play
1. `> git clone https://github.com/britnia/connect_four.git`
2. `bundle install`
3. `rails db:create`
4. `rails db:migrate`
5. `rails s`
6. Navigate to localhost:3000 in your browser and follow the onscreen instructions.

# Development ToDos
## for Primary Game Play
* error in show. somehow it's calling each on a string "b" now?!?!?
* decide if I'm going to use the delete feature. Tear it out if not.
* unit tests
* controller tests

## Get on Heroku
* switch over DB to use postgres instead of sqlite3
* get it on the herokus!

## Petty things because I'm a perfectionist
* pretty up the buttons
* fix alignment on index page (the list is centered on itself but not on the header/button)
* make the font bigger and the board smaller

## Give computer more brains
* Have computer try to block instead of just picking a random column

## For leaderboard feature
* Create player model to persist win/loss tally
* Show leaderboard
* Computer is also a player
