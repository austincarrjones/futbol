require 'date'

class Game
  attr_reader :game_id, :season, 
              :type, :date_time, 
              :away_team_id, :home_team_id, 
              :away_goals, :home_goals, 
              :venue, :venue_link
  
  def initialize(game_data)
    @game_id = game_data[:game_id].to_i
    @season = game_data[:season].to_s
    @type = game_data[:type]
    @date_time = game_data[:date_time].to_s
    @away_team_id = game_data[:away_team_id].to_i
    @home_team_id = game_data[:home_team_id].to_i
    @away_goals = game_data[:away_goals].to_i
    @home_goals = game_data[:home_goals].to_i
    @venue = game_data[:venue]
    @venue_link = game_data[:venue_link]
  end

  def self.all_games
    GameFactory.all_games
  end

  def total_score
    @away_goals + @home_goals
  end

  def self.highest_total_score
    all_games.map do |game|
      game.total_score
    end.max
  end

  def self.lowest_total_score
    all_games.map do |game| 
      game.total_score
    end.min
  end

  def self.game_count
    GameFactory.all_games.length
  end

  def self.percentage_home_wins
    (count_home_wins.to_f / game_count.to_f).round(2)
  end

  def self.percentage_away_wins
    (count_away_wins.to_f / game_count.to_f).round(2)
  end

  def self.percentage_ties
    (count_ties.to_f / game_count.to_f).round(2)
  end

  def self.count_of_games_by_season
    games_per_season = Hash.new(0)
    all_games.each do |game|
      games_per_season[game.season] += 1
    end
    games_per_season
  end

  def self.count_home_wins
    all_games.count do |game|
      game.home_win?
    end
  end

  def self.count_away_wins
    all_games.count do |game|
      game.away_win?
    end
  end

  def home_win?
    @home_goals > @away_goals
  end

  def away_win?
    @away_goals > @home_goals
  end

  def tie?
    @away_goals == @home_goals
  end

  def self.count_ties
    all_games.count do |game|
      game.tie?
    end
  end

  def self.average_goals_per_game
    average_goals = all_games.sum do |game|
      game.total_score.to_f
    end / game_count
    average_goals.round(2)
  end

  def self.average_goals_per_season
    goals_per_season = Hash.new(0)
    all_games.each do |game|
      goals_per_season[game.season] += game.total_score
    end
    goals_per_season.each do |season, total_goals|
      goals_per_season[season] = (total_goals / count_of_games_by_season[season].to_f).round(2)
    end
  end

  def self.away_goals_per_team
    away_goals = Hash.new(0)
    all_games.each do |game|
      away_goals[game.away_team_id] += game.away_goals
    end
    away_goals
  end

  def self.away_games_per_team
    away_games = Hash.new(0)
    all_games.each do |game|
      away_games[game.away_team_id] += 1
    end
    away_games
  end
  
  def self.away_average_goals_per_team
    avg_away_gpg = Hash.new(0)
    self.away_goals_per_team.each do |team, goals|
      avg_away_gpg[team] = (goals.to_f / Game.away_games_per_team[team]).round(2)
    end
    binding.pry
    avg_away_gpg
  end

  def self.highest_scoring_visitor

  end

end