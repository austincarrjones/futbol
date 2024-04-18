require 'spec_helper'

RSpec.describe GameFactory do
  describe 'creates Game objects from CSV data' do
    it 'creates Game objects' do
      factory = GameFactory.new
      games = factory.create_games("./fixtures/games_fixture.csv")

      expect(games).to all be_a(Game)
    end
  end
end