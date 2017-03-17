class GamesController < ApplicationController
  include Concerns::GameRules
  include Concerns::GamePlayHelper

  def index
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)

    if @game.save
      flash[:success] = "New game for #{game_params['player']} created successfully"
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
    ['b','r'].each do |p|
      turn p
      fetch_current_game
      if winner? @game.board
        winner_actions p and return
      end
      fetch_current_game if p == 'b'
    end
    render :edit
  end

  private
  def game_params
    params.require(:game).permit(:player, :board , :won, :column, :current_player)
  end

  def fetch_current_game
    @game = Game.find(params[:id])
  end
end
