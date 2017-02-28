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

#TODO DRY up this update block
  def update
    fetch_current_game
    #check if column can be dropped into
    if updatable_column? @game.board, game_params['column']
      # user turn
      if @game.update(game_params.merge!({current_player: 'b'}))
        flash[:success] = 'Game updated successfully'
        fetch_current_game
        # see if user won
        if winner? @game.board
          @game.update(game_params.merge!({won: true}))
          flash[:success] = 'Winner!'
          render :show and return
        else #if the the user didnt win its the computer's turn
          fetch_current_game
          computer_column = rand(7) #make sure the column the computer chose is updatable
          until updatable_column? @game.board, computer_column do
            computer_column = rand(7)
          end # drop computer piece
          if @game.update(game_params.merge!({column: computer_column, current_player: 'r'}))
            flash[:success] = 'Game updated successfully'
            fetch_current_game
            computer_board = @game.board
            if winner? computer_board # see if the computer won
              @game.update(game_params.merge!({won: false}))
              flash[:success] = 'Computer Wins!'
              render :show and return
            end
          end
          render :edit
        end
      else
        flash[:error] = 'There is a problem updating the game'
        render :edit and return
      end
    else
      flash[:error] = 'Choose an empty column.'
      redirect_to :edit_game and return
    end
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
end
