require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
  context "helper_methods" do
    let(:loser_board){
      {
        col_A:['e','e','e','e','e','e'],
        col_B:['e','e','e','e','e','e'],
        col_C:['e','e','e','e','e','e'],
        col_D:['e','e','e','e','e','e'],
        col_E:['e','e','e','e','e','e'],
        col_F:['e','e','e','e','e','e'],
        col_G:['e','e','e','e','e','e'],
      }
    }

    describe "#connect_four_by_column?" do
      let(:column_winner_board){
        {
          col_A:['r','e','e','e','e','e'],
          col_B:['b','r','r','r','r','e'],
          col_C:['b','r','e','e','e','e'],
          col_D:['b','b','e','e','e','e'],
          col_E:['r','b','e','e','e','e'],
          col_F:['b','e','e','e','e','e'],
          col_G:['b','e','e','e','e','e'],
        }
      }
      it "returns true when there is a connect four" do
        expect(connect_four_by_column? column_winner_board).to be_true
      end
      it "returns false when there is not a connect four" do
        expect(connect_four_by_column? loser_board).to be_false
      end
    end

    describe "#connect_four_by_row?" do
      let(:row_winner_board){
        {
          col_A:['e','e','e','e','e','e'],
          col_B:['e','e','e','e','e','e'],
          col_C:['e','e','e','e','e','e'],
          col_D:['e','e','e','e','e','e'],
          col_E:['e','e','e','e','e','e'],
          col_F:['e','e','e','e','e','e'],
          col_G:['e','e','e','e','e','e'],
        }
      }
      it "returns true when there is a connect four" do
        expect(connect_four_by_row? row_winner_board).to be_true
      end
      it "returns false when there is not a connect four" do
        expect(connect_four_by_row? loser_board).to be_false
      end
    end

    describe "#connect_four_by_diagonal?" do
      let(:diagonal_winner_board){
        {
          col_A:['e','e','e','e','e','e'],
          col_B:['e','e','e','e','e','e'],
          col_C:['e','e','e','e','e','e'],
          col_D:['e','e','e','e','e','e'],
          col_E:['e','e','e','e','e','e'],
          col_F:['e','e','e','e','e','e'],
          col_G:['e','e','e','e','e','e'],
        }
      }
      it "returns true when there is a connect four" do
        expect(connect_four_by_diagonal? diagonal_winner_board).to be_true
      end
      it "returns false when there is not a connect four" do
        expect(connect_four_by_diagonal? loser_board).to be_false
      end
    end

  end

end
