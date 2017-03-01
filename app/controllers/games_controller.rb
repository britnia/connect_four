class GamesController < ApplicationController
  include Concerns::GameRules

  def index
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)

    if @game.save
      flash[:success] = "New game for #{params[:player]} created successfully"
      render :edit
    else
      flash[:error] = 'There was a problem creating the game'
      render :new
    end
  end

  def show
    fetch_current_game
  end

  def edit
    fetch_current_game
  end

  def update
    fetch_current_game
    return full_column_error unless updatable_column? @game.board, game_params['column']
    turn 'b'
    fetch_current_game
    if winner? @game.board
      winner_actions 'b'
      render :show and return
    end
    if @game.won.nil?
      turn 'r'
      fetch_current_game
      if winner? @game.board
        winner_actions 'r'
        render :show and return
      end
    end
    render :edit
  end

  def destroy
    fetch_current_game
    if @game.delete
      flash[:success] = 'Game deleted successfully'
      redirect_to root_path
    else
      flash[:error] = 'There is a problem deleting the game'
      render :show
    end
  end

private
  def game_params
    params.require(:game).permit(:player, :board, :column, :current_player)
  end

  def updatable_column? board, column
    board[column.to_i].include? 'e'
  end

  def fetch_current_game
    @game = Game.find(params[:id])
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
  end

  def full_column_error
    flash[:error] = 'Choose an empty column.'
    redirect_to :edit_game
  end

  def not_updated_error
    flash[:error] = 'There is a problem updating the game'
    render :edit and return
  end
end
