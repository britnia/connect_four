# How to Play
* Follow this link -> https://agile-shelf-82332.herokuapp.com

# Development
1. Clone the repo `$ git clone https://github.com/britnia/connect_four.git`
2. Grab all the dependencies `$ bundle`
3. Create the database `$ rails db:create`
4. Migrate the database `$ rails db:migrate`
5. Start up the server `$ rails s`
6. Navigate to http://localhost:3000 in your browser and follow the onscreen instructions.

# Development ToDos
## for Primary Game Play
* controller concern tests
* test for drop piece method
* handle a tie game
* DRY up view with a partial for the game board

## Give computer more brains
* Have computer try to block/win instead of just picking a random column

## For leaderboard feature
* Create player model to persist win/loss tally
* Show leaderboard
* Computer is also a player
