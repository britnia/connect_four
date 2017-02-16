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
      next if current == 'e'
      if current = last
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
  #found some snippet online about how to turn an array diagonal

  padding = board.size - 1
  padded_matrix = []

  board.each do |row|
    inverse_padding = board.size - padding
    padded_matrix << ([nil] * inverse_padding) + row + ([nil] * padding)
    padding -= 1
  end
  diagonal_matrix = padded_matrix.transpose.map(&:compact)
  diagonal_matrix_flip = padded_matrix.map(&:compact)

  try_1 = connect_four_by_column? diagonal_matrix
  return try_1 unless try_1 == false
  connect_four_by_column? diagonal_matrix_flip
end

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
