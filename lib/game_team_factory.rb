require "csv"

class GameTeamFactory
  @@game_teams = []

  def self.create_game_teams(file_path)
    CSV.foreach(file_path, headers: true, header_converters: :symbol) do |row|
      game_team_data = {
        game_id: row[:game_id],
        team_id: row[:team_id],
        hoa: row[:hoa],
        result: row[:result],
        head_coach: row[:head_coach],
        goals: row[:goals],
        shots: row[:shots],
        tackles: row[:tackles]
      }

      @@game_teams << GameTeam.new(game_team_data)
    end
    @@game_teams
  end

  def self.all_game_teams
    @@game_teams
  end
end