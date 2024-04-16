require 'spec_helper'

RSpec.describe TeamFactory do

  it 'exists' do
    team_factory = TeamFactory.new
    expect(team_factory).to be_a TeamFactory
  end

  it 'can create teams' do
    team_factory = TeamFactory.new
    teams = team_factory.create_teams
  end
  
  it "has attributes from CSV header" do
    team_factory = TeamFactory.new
    team_1 = Team.new(1, 23, "Atlanta United", "ATL", "Mercedes-Benz Stadium", "/api/v1/teams/1")
    
    binding.pry
    expect(team_1.team_id).to eq 1

  end

end