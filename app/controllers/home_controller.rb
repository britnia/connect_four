class HomeController < ApplicationController
  # The gameboard could be a hash or a 2D array?
  # Possible states for each cell: empty, red, black
  # e = empty
  # r = red
  # b = black

  #   0   1   2   3   4   5 <- rows

def connect_four_by_column? board
  board.each do |column|
    return false if column.first == 'e'
    count = 0
    last = column.first
    while !column.empty? do
      current = column.shift
      next if current == 'e' || current == 0
      if current == last
        count += 1
        return true if count == 4
      else
        count = 1
      end
      last = current
    end
  end
  false
end

def connect_four_by_row? board
  board = board.transpose
  connect_four_by_column? board
end

def connect_four_by_diagonal? board
 #get all the diagonals into a map
 #do connect four by column on the map

end

def drop_piece board, player, input
  #where input = the column number 0-6
  board[input].each_index do |i|
    if board[input][i] == 'e'
      board[input][i] = player
      return board
    end
    board
  end
end

def winner? board
  return true if connect_four_by_column? board
  return true if connect_four_by_row? board
  #return true if connect_four_by_diagonal? board
  false
end

def turn player, input
  @board = drop_piece @board, player, input
  return "Player #{player} wins!" if winner? @board
end

def set_first_player
  return 'b' if rand(2) == 1
  'r'

end

def player_switch player
  return 'b' if player == 'r'
  'r'
end

def game
  #randomize who starts
  current_player = set_first_player
  # computer is always red. Player is always black.
  while winner? @board == false do
    column = 0 #get user input here
    #TODO worry about full columns
    @board = drop_piece @board, current_player, column
    current_player = switch_player current_player
  end


end
#Basic workflow of a turn
  #player selects which column they want to drop the piece into
  #the first element in the column array that is empty (e) has it's value changed to match the current player's color
  #check for connect four by row
  #check for connect 4 by column
  #check for connect four by diagonal
  #if the player has won game over
  #if no winner, repeat all this for the next player

  def index
    @game_board = [
      ['e','e','e','e','e','e'], # 0
      ['e','e','e','e','e','e'], # 1
      ['e','e','e','e','e','e'], # 2
      ['e','e','e','e','e','e'], # 3
      ['e','e','e','e','e','e'], # 4
      ['e','e','e','e','e','e'], # 5
      ['e','e','e','e','e','e']  # 6
    ]
  end
end
