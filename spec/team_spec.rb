require 'spec_helper'

RSpec.describe TeamFactory do

  it 'exists' do
    team = Team.new({team_id: 1, team_name: "Atlanta United"})
    expect(team).to be_a Team
  end

  it "has attributes from CSV header" do
    team_1 = Team.new({team_id: 1, team_name: "Atlanta United"})
    
    expect(team_1.team_id).to eq 1
    expect(team_1.team_name).to eq "Atlanta United"
  end
  
  it "#count_of_teams" do
    teams = TeamFactory.create_teams('./data/teams.csv')
    expect(Team.count_of_teams).to eq 32
  end

end