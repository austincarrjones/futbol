class TeamFactory
  @@teams = []
  
  def self.create_teams(path)
    CSV.foreach(path, headers: true, header_converters: :symbol) do |row|
      @@teams << Team.new(team_id: row[:team_id], team_name: row[:teamname])
    end
    @@teams
  end
  
  def self.all_teams
    @@teams
  end

  def self.reset_teams
    @@teams = []
  end

end