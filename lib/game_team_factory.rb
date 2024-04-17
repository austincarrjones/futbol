require "csv"

class GameTeamFactory
  @@game_teams = []

  def self.create_from_csv(file_path)
    CSV.foreach(file_path, headers: true, header_converters: :symbol) do |row|
      game_team_data = {
        game_id: row[:game_id],
        team_id: row[:team_id],
        hoa: row[:hoa],
        result: row[:result],
        settled_in: row[:settled_in],
        head_coach: row[:head_coach],
        goals: row[:goals],
        shots: row[:shots],
        tackles: row[:tackles],
        pim: row[:pim],
        ppo: row[:powerplayopportunities],
        ppg: row[:powerplaygoals],
        faceoff_win_per: row[:faceoffwinpercentage],
        giveaways: row[:giveaways],
        takeaways: row[:takeaways]
      }
      @@game_teams << GameTeam.new(game_team_data)
    end
    @@game_teams
  end
end