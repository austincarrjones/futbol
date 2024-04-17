class GameFactory
  attr_reader :games

  def initialize
    @games = []
  end

  def create_games(path)
    CSV.foreach((path), headers: true, header_converters: :symbol) do |row|
      @games << Game.new(
        game_id: row[:game_id], 
        season: row[:season], 
        type: row[:type], 
        date_time: row[:date_time], 
        away_team_id: row[:away_team_id], 
        home_team_id: row[:home_team_id], 
        away_goals: row[:away_goals], 
        home_goals: row[:home_goals], 
        venue: row[:venue], 
        venue_link: row[:venue_link])
    end
  end
end