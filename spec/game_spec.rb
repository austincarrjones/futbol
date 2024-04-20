require 'spec_helper'

RSpec.describe Game do
  describe 'initialize' do
    it 'exists' do
      game1 = Game.new({game_id: 2012030221, season: 20122013, type: :Postseason, date_time: 5/16/13, away_team_id: 3, home_team_id: 6, away_goals: 2, home_goals: 3, venue: 'Toyota Stadium', venue_link: '/api/v1/venues/null'})

      expect(game1).to be_a(Game)
    end

    it 'has the correct data types in attributes' do
      game1 = Game.new({game_id: 2012030221, season: 20122013, type: :Postseason, date_time: '5/16/13', away_team_id: 3, home_team_id: 6, away_goals: 2, home_goals: 3, venue: 'Toyota Stadium', venue_link: '/api/v1/venues/null'})

      expect(game1.game_id).to be_a(Integer)
      expect(game1.season).to be_a(String)
      expect(game1.type).to be_a(Symbol)
      expect(game1.date_time).to be_a(String)
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
      GameFactory.new
      GameFactory.create_games("./fixtures/games_fixture.csv")

      expect(Game.all_games).to be_a(Array)
      expect(Game.all_games.length).to eq(20)
      expect(Game.all_games).to all be_a(Game)

      GameFactory.reset_games
    end

    it 'can calculate the total score of a game' do
      game1 = Game.new({game_id: 2012030221, season: 20122013, type: :Postseason, date_time: 5/16/13, away_team_id: 3, home_team_id: 6, away_goals: 2, home_goals: 3, venue: 'Toyota Stadium', venue_link: '/api/v1/venues/null'})

      expect(game1.total_score).to eq(5)
    end

    it 'can calculate the highest total score of a game' do
      GameFactory.new
      GameFactory.create_games("./fixtures/games_fixture.csv")

      expect(Game.highest_total_score).to eq(5)

      GameFactory.reset_games
    end

    it 'can calculate the lowest total score of a game' do
      GameFactory.new
      GameFactory.create_games("./fixtures/games_fixture.csv")

      expect(Game.lowest_total_score).to eq(1)

      GameFactory.reset_games
    end
  end

  describe 'can calculate percentage of wins' do
    it 'can calculate percentage of home wins' do
      GameFactory.new
      GameFactory.create_games("./fixtures/games_fixture.csv")

      expect(Game.percentage_home_wins).to eq(0.7)

      GameFactory.reset_games
    end

    it 'can calculate percentage of away wins' do
      GameFactory.new
      GameFactory.create_games("./fixtures/games_fixture.csv")

      expect(Game.percentage_away_wins).to eq(0.25)

      GameFactory.reset_games
    end

    it 'can tell if a home team won' do
      game1 = Game.new({game_id: 2012030221, season: 20122013, type: :Postseason, date_time: 5/16/13, away_team_id: 3, home_team_id: 6, away_goals: 2, home_goals: 3, venue: 'Toyota Stadium', venue_link: '/api/v1/venues/null'})

      expect(game1.home_win?).to eq(true)
    end

    it 'can tell if a away team won' do
      game1 = Game.new({game_id: 2012030221, season: 20122013, type: :Postseason, date_time: 5/16/13, away_team_id: 3, home_team_id: 6, away_goals: 2, home_goals: 3, venue: 'Toyota Stadium', venue_link: '/api/v1/venues/null'})

      expect(game1.away_win?).to eq(false)
    end

    it 'can count the total number of home wins' do
      GameFactory.new
      GameFactory.create_games("./fixtures/games_fixture.csv")

      expect(Game.count_home_wins).to eq(14)

      GameFactory.reset_games
    end

    it 'can count the total number of away wins' do
      GameFactory.new
      GameFactory.create_games("./fixtures/games_fixture.csv")

      expect(Game.count_away_wins).to eq(5.0)

      GameFactory.reset_games
    end

    it 'can return a count of all games' do
      GameFactory.new
      GameFactory.create_games("./fixtures/games_fixture.csv")

      expect(Game.game_count).to eq(20)

      GameFactory.reset_games
    end

    it 'can calculate the percantage of ties' do
      GameFactory.new
      GameFactory.create_games("./fixtures/games_fixture.csv")

      expect(Game.percentage_ties).to eq(0.05)

      GameFactory.reset_games
    end

    it 'can determine if a game was a tie' do
      game1 = Game.new({game_id: 2012030221, season: 20122013, type: :Postseason, date_time: 5/16/13, away_team_id: 3, home_team_id: 6, away_goals: 2, home_goals: 3, venue: 'Toyota Stadium', venue_link: '/api/v1/venues/null'})
      game2 = Game.new({game_id: 2012030222, season: 20122013, type: :Postseason, date_time: 5/19/13, away_team_id: 3, home_team_id: 6, away_goals: 3, home_goals: 3, venue: 'Toyota Stadium', venue_link: '/api/v1/venues/null'})

      expect(game1.tie?).to eq(false)
      expect(game2.tie?).to eq(true)
    end

    it 'can give a count of total number of tie games' do
      GameFactory.new
      GameFactory.create_games("./fixtures/games_fixture.csv")

      expect(Game.count_ties).to eq(1)

      GameFactory.reset_games
    end
  end

  describe 'games per season' do
    it 'can return a hash with season and games in that season' do
      GameFactory.new
      GameFactory.create_games("./fixtures/games_fixture.csv")
      resulting_array = {
        "20122013" => 20
      }

      expect(Game.count_of_games_by_season).to eq(resulting_array)
      GameFactory.reset_games
    end
  end

  describe 'average goals per game' do
    it 'can calculate average number of goals per game' do
      GameFactory.new
      GameFactory.create_games("./fixtures/games_fixture.csv")

      expect(Game.average_goals_per_game).to eq(3.75)

      GameFactory.reset_games
    end
  end

  describe 'hash of average goals per season' do
    it 'can calculate average goals per season and add that to a hash' do
      GameFactory.new
      GameFactory.create_games("./fixtures/games_fixture.csv")
      expected_outcome = {
        "20122013" => 3.75
      }

      expect(Game.average_goals_per_season).to eq(expected_outcome)
      GameFactory.reset_games
    end
  end

  describe '#away_goals_per_team' do
    it 'returns hash of teams and total away game goals' do
      GameFactory.new
      GameFactory.create_games("./fixtures/games_fixture.csv")
      
      expect(Game.away_goals_per_team).to eq({3=>5, 6=>12, 5=>1, 17=>5, 16=>3, 9=>3, 8=>3})
      
      GameFactory.reset_games
    end
  end

  describe '#away_games_per_team' do
    it 'returns hash of teams and total away games' do
      GameFactory.new
      GameFactory.create_games("./fixtures/games_fixture.csv")
      
      expect(Game.away_games_per_team).to eq({3=>3, 6=>4, 5=>2, 17=>4, 16=>3, 9=>2, 8=>2})
      
      GameFactory.reset_games
    end
  end
  
  describe '#away_avg_goals_per_team' do
    it 'returns hash of teams and average away game goals' do
      GameFactory.new
      GameFactory.create_games("./fixtures/games_fixture.csv")
      
      expect(Game.away_avg_goals_per_team).to eq({3=>1.67, 6=>3.0, 5=>0.5, 17=>1.25, 16=>1.0, 9=>1.5, 8=>1.5})
      
      GameFactory.reset_games
    end
  end

  describe '#highest_scoring_visitor' do
    it 'can name the awat team with the highest average score per game' do
      GameFactory.new
      GameFactory.create_games("./fixtures/games_fixture.csv")
      
      expect(Game.highest_scoring_visitor).to eq "FC Dallas"

      GameFactory.reset_games
    end
  end

  describe '#lowest_scoring_visitor' do
    it 'can name the away team with the lowest average score per game' do
      GameFactory.new
      GameFactory.create_games("./fixtures/games_fixture.csv")
      
      expect(Game.lowest_scoring_visitor).to eq "Sporting Kansas City"

      GameFactory.reset_games
    end
  end
end