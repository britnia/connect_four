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
          ['e','e','e','e','e','e'],
          ['e','e','e','e','e','e'],
          ['e','e','e','e','e','e'],
          ['e','e','e','e','e','e'],
          ['e','e','e','e','e','e'],
          ['e','e','e','e','e','e'],
          ['e','e','e','e','e','e']
        ]
      }
      it "returns true when there is a connect four" do
        expect(connect_four_by_row? row_winner_board).to be true
      end
      it "returns false when there is not a connect four" do
        expect(connect_four_by_row? loser_board).to be false
      end
    end

    describe "#connect_four_by_diagonal?" do
      let(:diagonal_winner_board){
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
      it "returns true when there is a connect four" do
        expect(connect_four_by_diagonal? diagonal_winner_board).to be true
      end
      it "returns false when there is not a connect four" do
        expect(connect_four_by_diagonal? loser_board).to be false
      end
    end

  end

end
