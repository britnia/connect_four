class HomeController < ApplicationController
  # The gameboard could be a hash or a 2D array?
  # Possible states for each cell: empty, red, black
  # e = empty
  # r = red
  # b = black
  @game_board = {
    col_A:['e','e','e','e','e','e'],
    col_B:['e','e','e','e','e','e'],
    col_C:['e','e','e','e','e','e'],
    col_D:['e','e','e','e','e','e'],
    col_E:['e','e','e','e','e','e'],
    col_F:['e','e','e','e','e','e'],
    col_G:['e','e','e','e','e','e'],
  }


#Methods needed:
  #Something that replaces the first element in a stack that isn't empty
  #Something that checks for 4 in a rows by column
  #Something that checks for 4 in a rows by row
  #Something that checks for 4 in a rows by diagonal -> probably the hardest thing????
  #
  #
  #
#Basic workflow of a turn
  #player selects which column they want to drop the piece into
  #the first element in the column array that is empty (e) has it's value changed to match the current player's color
  #check for connect four by row
  #check for connect 4 by column
  #check for connect four by diagonal
  #if the player has won game over
  #if no winner, repeat all this for the next player

  def index
  end
end
