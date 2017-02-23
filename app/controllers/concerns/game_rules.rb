module Concerns::GameRules

  def winner? board
    connect_four_by_row?(board) || connect_four_by_column?(board)
    #return true if connect_four_by_diagonal? board
  end

  private

  def connect_four_by_column? board
    board.each do |column|
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
    flip_board = board.transpose
    connect_four_by_column? flip_board
  end

  def connect_four_by_diagonal? board
    #get all the diagonals into a map
    #do connect four by column on the map

  end
end
