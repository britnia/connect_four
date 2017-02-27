module Concerns::GameRules
  def winner? board
    connect_four_by_row?(board) || connect_four_by_column?(board) || connect_four_by_diagonal?(board)
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
    connect_four_by_column?(all_the_diagonals board)
  end

  def all_the_diagonals board
    diagonals_one_way(board) + diagonals_one_way(board.reverse)
  end

  def diagonals_one_way board
    [
      [board[3][0],board[2],[1],board[1][2],board[0][3]],
      [board[4][0],board[3][1],board[2][2],board[1][3],board[0][4]],
      [board[5][0],board[4][1],board[3][2],board[2][3],board[1][4],board[0][5]],
      [board[6][0],board[5][1],board[4][2],board[3][3],board[2][4],board[1][5]],
      [board[6][1],board[5][2],board[4][3],board[3][4],board[2][5]],
      [board[6][2],board[5],[3],board[4][4],board[3][5]]
    ]

  end
end
