class TeamFactory
  
  def create_teams
    CSV.foreach('./data/teams.csv', headers: true, header_converters: :symbol) do |row|
      team_id = row[:team_id].to_i
      franchise_id = row[:franchise_id].to_i
      team_name = row[:team_name]
      abbreviation = row[:abbreviation]
      stadium = row[:stadium]
      link = row[:link]
      team = Team.new(team_id, franchise_id, team_name, abbreviation, stadium, link)

      #puts "#{team.team_name} has been created!"
    end
    # binding.pry
  end

end