class Game < ApplicationRecord
  serialize :board, Array
  attr_accessor :column

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
     working_board = self.board
     col = self.column.to_i
     self.board = working_board[col].each_index do |i|
                    if working_board[col][i] == 'e'
                      working_board[col][i] = 'b'#player
                      return working_board
                    end
                    working_board
                  end
    puts self.board
   end

end
