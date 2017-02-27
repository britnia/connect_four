require 'rails_helper'
include Concerns::GameRules

describe Concerns::GameRules do
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
  let(:diagonal_winner_board_r_t_l){
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
  let(:diagonal_winner_board_l_t_r){
    [
      ['b','e','e','e','e','e'],
      ['r','e','e','e','e','e'],
      ['r','b','e','e','e','e'],
      ['b','r','r','b','e','e'],
      ['r','r','r','e','e','e'],
      ['b','b','b','r','e','e'],
      ['b','b','r','e','e','e']
    ]
  }

  describe "#winner?" do
    it "returns false if there is no winner" do
      expect(winner? loser_board).to be false
    end

    it "returns true if there is a winner by column" do
      expect(winner? column_winner_board).to be true
    end

    it "returns true when there is winner by row" do
      expect(winner? row_winner_board).to be true
    end

    it "returns true when there is a diagonal winner" do
      expect(winner? diagonal_winner_board_l_t_r).to be true
      expect(winner? diagonal_winner_board_r_t_l).to be true
    end
  end
end
