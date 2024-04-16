require 'spec_helper'

RSpec.describe Game do
  describe 'initialize' do
    it 'exists' do
      game = Game.new(2012030221,20122013,Postseason,5/16/13,3,6,2,3,Toyota Stadium,/api/v1/venues/null)

      expect(game).to be_a(Game)
    end
  end
end