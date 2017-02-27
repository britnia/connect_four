# TODO

## for Primary Game Play
* ~handle full columns (right now trying to drop into a full column results in an error. instead the db update should fail and the user should get a message telling her to chose a different column. If the computer chooses a full column no message needs to show but it should be forced to try again until it picks a good one. it's probably easiest to handle this in the controller)~
* ~new fun bug uncovered!!! -- When the computer wins it gets real mad about the render :edit~
* error in show. somehow it's calling each on a string "b" now?!?!?
* get diagonal winner
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
