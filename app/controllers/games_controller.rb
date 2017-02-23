class GamesController < ApplicationController

  include Concerns::GameRules
#saving this here just to have it somewhere handy

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

# do i need show????
  def show
    @game = Game.find(params[:id])
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update

    @game = Game.find(params[:id])
    if @game.update(game_params.merge!({current_player: 'b'}))
      flash[:success] = 'Game updated successfully'
      @game = Game.find(params[:id])
      if winner? @game.board #player wins
        flash[:success] = 'Winner!'
        render :show
        #some winner actions here
      else #computer's turn
        @game = Game.find(params[:id])
        computer_column = rand(7)
        if @game.update(game_params.merge!({column: computer_column, current_player: 'r'}))
          flash[:success] = 'Game updated successfully'
          computer_board = Game.find(params[:id]).board
          if winner? computer_board #computer wins
            flash[:success] = 'Computer Wins!'
            render :show
            #some winner actions here
          end
        end
        render :edit
      end
    else
      flash[:error] = 'There is a problem updating the game'
      render :edit
    end
  end

  def destroy
    @game = Game.find(params[:id])
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

  def computer_params p
  end

end
