module Concerns::GamePlayHelper
  def updatable_column? board, column
    board[column.to_i].include? 'e'
  end

  def computer_column
    computer_column = rand(7)
    until updatable_column? @game.board, computer_column do
      computer_column = rand(7)
    end
    computer_column
  end

  def turn player
    if player == 'b'
      @game.update(game_params.merge!({current_player: 'b'}))
    else
      @game.update(game_params.merge!({column: computer_column, current_player: 'r'}))
    end
    flash[:success] = 'Game updated successfully'
  end

  def winner_actions player
    if player == 'b'
      @game.update({won: true})
      flash[:success] = 'Winner!'
    else
      @game.update({won: false})
      flash[:success] = 'Computer wins!'
    end
    render :show
  end

  def full_column_error
    flash[:error] = 'Choose an empty column.'
    redirect_to :edit_game
  end

  def not_updated_error
    flash[:error] = 'There is a problem updating the game'
    render :edit
  end
end
