require 'spec_helper'

RSpec.describe GameFactory do
  describe 'creates Game objects from CSV data' do
    it 'creates Game objects' do
      factory = GameFactory.new
      games = GameFactory.create_games("./fixtures/games_fixture.csv")

      expect(games).to all be_a(Game)
    end

    it 'can show all games' do
      GameFactory.new
      games = GameFactory.create_games("./fixtures/games_fixture.csv")

      expect(games).to eq(GameFactory.all_games)
    end

    it 'can reset the games class variable' do
      GameFactory.new
      games = GameFactory.create_games("./fixtures/games_fixture.csv")
      GameFactory.reset_games

      expect(GameFactory.all_games).to eq([])
    end
  end
end