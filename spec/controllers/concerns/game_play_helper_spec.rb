require 'rails_helper'
include Concerns::GamePlayHelper

describe Concerns::GamePlayHelper do
  let(:board) {
    [
      ['b','b','b','e'],
      ['b','b','b','r'],
      ['b','b','b','e'],
      ['b','b','b','r'],
      ['b','b','b','e'],
      ['b','b','b','r'],
      ['b','b','b','e']
    ]
  }
  describe '#updatable_column?' do
    it 'returns true if the column is updatable' do
      expect(updatable_column? board, 0).to be true
    end

    it 'returns false if the column is not updatable' do
      expect(updatable_column? board, 1).to be false

    end
  end

end
