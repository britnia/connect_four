require 'rails_helper'
require 'home_controller'

describe HomeController do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
  context "helper_methods" do
    let(:loser_board){
      [
        ['e','e','e','e','e','e'],
        ['e','e','e','e','e','e'],
        ['e','e','e','e','e','e'],
        ['e','e','e','e','e','e'],
        ['e','e','e','e','e','e'],
        ['e','e','e','e','e','e'],
        ['e','e','e','e','e','e']
      ]
    }

    describe "#drop_piece" do
        it "returns a board with a piece dropped into the prescribed column" do
          result_board = subject.drop_piece loser_board, 'r', 0
          expect(result_board[0][0]).to eq 'r'
          expect(result_board[1][0]).to eq 'e'
          expect(result_board[2][0]).to eq 'e'
          expect(result_board[3][0]).to eq 'e'
          expect(result_board[4][0]).to eq 'e'
          expect(result_board[5][0]).to eq 'e'
          expect(result_board[6][0]).to eq 'e'
        end
    end

    describe "#winner?" do
      let(:winner_board){
        [
          ['r','e','e','e','e','e'],
          ['b','r','r','r','r','e'],
          ['b','r','e','e','e','e'],
          ['b','b','e','e','e','e'],
          ['r','b','e','e','e','e'],
          ['b','e','e','e','e','e'],
          ['b','e','e','e','e','e']
        ]
      }
      it "returns false if there is no winner" do
        expect(subject.winner? loser_board).to be false
      end

      it "returns true if there is a winner" do
        expect(subject.winner? winner_board).to be true
      end

    end

    describe "#connect_four_by_column?" do
      let(:column_winner_board){
        [
          ['r','e','e','e','e','e'],
          ['b','r','r','r','r','e'],
          ['b','r','e','e','e','e'],
          ['b','b','e','e','e','e'],
          ['r','b','e','e','e','e'],
          ['b','e','e','e','e','e'],
          ['b','e','e','e','e','e']
        ]
      }
      it "returns true when there is a connect four" do
        expect(subject.connect_four_by_column? column_winner_board).to be true
      end
      it "returns false when there is not a connect four" do
        expect(subject.connect_four_by_column? loser_board).to be false
      end
    end

    describe "#connect_four_by_row?" do
      let(:row_winner_board){
        [
          ['r','b','e','e','e','e'],
          ['b','r','e','e','e','e'],
          ['r','r','e','e','e','e'],
          ['b','r','e','e','e','e'],
          ['r','r','e','e','e','e'],
          ['b','b','e','e','e','e'],
          ['r','b','e','e','e','e']
        ]
      }
      it "returns true when there is a connect four" do
        expect(subject.connect_four_by_row? row_winner_board).to be true
      end
      it "returns false when there is not a connect four" do
        expect(subject.connect_four_by_row? loser_board).to be false
      end
    end

    describe "#connect_four_by_diagonal?" do
      let(:diagonal_winner_board){
        [
          ['b','e','e','e','e','e'],
          ['r','e','e','e','e','e'],
          ['r','b','e','e','e','e'],
          ['b','r','r','b','e','e'],
          ['r','r','b','e','e','e'],
          ['b','b','e','e','e','e'],
          ['b','b','r','e','e','e']
        ]
      }
      xit "returns true when there is a connect four" do
        expect(subject.connect_four_by_diagonal? diagonal_winner_board).to be true
      end
      xit "returns false when there is not a connect four" do
        expect(subject.connect_four_by_diagonal? loser_board).to be false
      end
    end

  end

end
