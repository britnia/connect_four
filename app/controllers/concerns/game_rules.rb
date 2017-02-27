module Concerns::GameRules

  def winner? board
    connect_four_by_row?(board) || connect_four_by_column?(board)
    #return true if connect_four_by_diagonal? board
  end

  private

  def connect_four_by_column? board
    board.each do |column|
      return true if (column.reverse.join.include?('bbbb') || column.reverse.join.include?('rrrr'))
    end
    false
  end

  def connect_four_by_row? board
    connect_four_by_column? board.transpose
  end

  def connect_four_by_diagonal? board
    #get all the diagonals into a map
    #do connect four by column on the map
  end
end
