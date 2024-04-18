require_relative "./game"
require_relative "./game_factory"
require_relative "./team"
require_relative "./team_factory"
require_relative "./game_team"
require_relative "./game_team_factory"

class StatTracker
  attr_reader :games, 
              # :teams, 
              :game_teams

  def initialize(games, game_teams)
    @games = games
    # @teams = teams
    @game_teams = game_teams
  end

  def self.from_csv(locations)
    games = GameFactory.create_games(locations[:games])
    # teams = TeamFactory.create_teams(locations[:teams])
    game_teams = GameTeamFactory.create_game_teams(locations[:game_teams])
    StatTracker.new(games, game_teams)
  end

  def highest_total_score
    Game.highest_total_score
  end

  def lowest_total_score
    Game.lowest_total_score
  end

  def percentage_home_wins
    Game.percentage_home_wins
  end

  def percentage_visitor_wins
    Game.percentage_away_wins
  end

  def winningest_coach(season)
    GameTeam.winningest_coach(season)
  end
end