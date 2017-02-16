class HomeController < ApplicationController
  # The gameboard could be a hash or a 2D array?
  # Possible states for each cell: empty, red, black
  # e = empty
  # r = red
  # b = black
  @game_board = [
    ['e','e','e','e','e','e'],
    ['e','e','e','e','e','e'],
    ['e','e','e','e','e','e'],
    ['e','e','e','e','e','e'],
    ['e','e','e','e','e','e'],
    ['e','e','e','e','e','e'],
    ['e','e','e','e','e','e']
  ]

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
  connect_four_by_column board
end

def connect_four_by_diagonal? board
# other attempts a bust. come back to this later


  try_1 = connect_four_by_column diagonals
  return try_1 unless try_1 == false
  connect_four_by_column diagonals.transpose
end

def drop_piece board, player, input
  board[input].each_index do |i|
    if board[i] == 'e'
      board[i] = player
      return board
    end
    board
  end
end

def winner? board
  return true if connect_four_by_column? board
  return true if connect_four_by_row? board
  return true if connect_four_by_diagonal? board
  false
end

def turn player, input
  @board = drop_piece @board, player, input
  return "Player #{player} wins!" if winner? @board
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
  end
end
