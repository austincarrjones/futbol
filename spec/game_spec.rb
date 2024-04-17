require 'spec_helper'

RSpec.describe Game do
  describe 'initialize' do
    it 'exists' do
      game1 = Game.new({game_id: 2012030221, season: 20122013, type: :Postseason, date_time: 5/16/13, away_team_id: 3, home_team_id: 6, away_goals: 2, home_goals: 3, venue: 'Toyota Stadium', venue_link: '/api/v1/venues/null'})

      expect(game1).to be_a(Game)
    end

    it 'has the correct data types in attributes' do
      game1 = Game.new({game_id: 2012030221, season: 20122013, type: :Postseason, date_time: 5/16/13, away_team_id: 3, home_team_id: 6, away_goals: 2, home_goals: 3, venue: 'Toyota Stadium', venue_link: '/api/v1/venues/null'})

      expect(game1.game_id).to be_a(Integer)
      expect(game1.season).to be_a(Integer)
      expect(game1.type).to be_a(Symbol)
      expect(game1.date_time).to be_a(Integer)
      expect(game1.away_team_id).to be_a(Integer)
      expect(game1.home_team_id).to be_a(Integer)
      expect(game1.away_goals).to be_a(Integer)
      expect(game1.home_goals).to be_a(Integer)
      expect(game1.venue).to be_a(String)
      expect(game1.venue_link).to be_a(String)
    end
  end

  describe 'total score methods' do
    it 'can return all games' do
      factory = GameFactory.new
      factory.create_games("./fixtures/games_fixture.csv")

      expect(Game.all_games).to be_a(Array)
      expect(Game.all_games.length).to eq(20)
      expect(Game.all_games).to all be_a(Game)
    end

    it 'can calculate the total score of a game' do
      game1 = Game.new({game_id: 2012030221, season: 20122013, type: :Postseason, date_time: 5/16/13, away_team_id: 3, home_team_id: 6, away_goals: 2, home_goals: 3, venue: 'Toyota Stadium', venue_link: '/api/v1/venues/null'})

      expect(game1.total_score).to eq(5)
    end

    it 'can calculate the highest total score of a game' do
      factory = GameFactory.new
      factory.create_games("./fixtures/games_fixture.csv")

      expect(Game.highest_total_score).to eq(5)
    end

    it 'can calculate the lowest total score of a game' do
      factory = GameFactory.new
      factory.create_games("./fixtures/games_fixture.csv")

      expect(Game.lowest_total_score).to eq(1)
    end
  end
end