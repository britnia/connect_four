class Game < ApplicationRecord
  serialize :board, Array
  attr_accessor :column, :current_player

  before_create :init
  before_update :drop_piece

  def init
    self.board = [
      ['e','e','e','e','e','e'],
      ['e','e','e','e','e','e'],
      ['e','e','e','e','e','e'],
      ['e','e','e','e','e','e'],
      ['e','e','e','e','e','e'],
      ['e','e','e','e','e','e'],
      ['e','e','e','e','e','e']
    ]
  end

  def drop_piece
    return unless self.current_player
    working_board = self.board
    col = self.column.to_i
    self.board = working_board[col].each_index do |i|
      if working_board[col][i] == 'e'
        working_board[col][i] = self.current_player # 'b' or 'r'
        return working_board
      end
        working_board
    end
  end
end
