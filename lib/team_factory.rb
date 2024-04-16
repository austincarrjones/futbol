class TeamFactory

  def create_teams
    CSV.foreach('./data/teams.csv', headers: true, header_converters: :symbol) do |row|
      team_id = row[:team_id]
      franchise_id = row[:franchise_id]
      team_name = row[:team_name]
      abbreviation = row[:abbreviation]
      stadium = row[:stadium]
      link = row[:link]

      require 'pry'; binding.pry
    end
  end

end