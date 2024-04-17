class TeamFactory

  def initialize
    @teams = []
  end
  
  def create_teams
    CSV.foreach('./data/teams.csv', headers: true, header_converters: :symbol) do |row|
      @teams << Team.new(
      team_id: row[:team_id].to_i,
      franchise_id: row[:franchise_id].to_i,
      team_name: row[:teamname],
      abbreviation: row[:abbreviation],
      stadium: row[:stadium],
      link: row[:link])
    end
    @teams
  end
end