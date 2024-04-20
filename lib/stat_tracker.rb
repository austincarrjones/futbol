require_relative "./game"
require_relative "./game_factory"
require_relative "./team"
require_relative "./team_factory"
require_relative "./game_team"
require_relative "./game_team_factory"

class StatTracker
  attr_reader :games, 
              :teams, 
              :game_teams

  def initialize(games, teams, game_teams)
    @games = games
    @teams = teams
    @game_teams = game_teams
  end

  def self.from_csv(locations)
    games = GameFactory.create_games(locations[:games])
    teams = TeamFactory.create_teams(locations[:teams])
    game_teams = GameTeamFactory.create_game_teams(locations[:game_teams])
    StatTracker.new(games, teams, game_teams)
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

  def percentage_ties
    Game.percentage_ties
  end

  def count_of_games_by_season
    Game.count_of_games_by_season
  end

  def average_goals_per_game
    Game.average_goals_per_game
  end

  def average_goals_by_season
    Game.average_goals_per_season
  end

  def count_of_teams
    Team.count_of_teams
  end

  def winningest_coach(season)
    GameTeam.winningest_coach(season)
  end

  def worst_coach(season)
    GameTeam.worst_coach(season)
  end

  def most_tackles(season)
    GameTeam.most_tackles(season)
  end

  def fewest_tackles(season)
    GameTeam.fewest_tackles(season)
  end

  def best_offense
    GameTeam.best_offense
  end
end