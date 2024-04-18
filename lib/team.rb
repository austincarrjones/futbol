class Team
  attr_reader :team_id,
              :team_name

  def initialize(teams_data) 
    @team_id = teams_data[:team_id].to_i
    @team_name = teams_data[:team_name]
  end

  def self.all_teams
    TeamFactory.all_teams
  end

  def self.count_of_teams
    TeamFactory.all_teams.count
  end

end