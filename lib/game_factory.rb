class GameFactory
  @@games = []

  def self.create_games(path)
    CSV.foreach(path, headers: true, header_converters: :symbol) do |row|
      @@games << Game.new(
        game_id: row[:game_id], 
        season: row[:season], 
        away_team_id: row[:away_team_id], 
        home_team_id: row[:home_team_id], 
        away_goals: row[:away_goals], 
        home_goals: row[:home_goals])
    end
    @@games
  end

  def self.all_games
    @@games
  end

  def self.reset_games
    @@games = []
  end
end