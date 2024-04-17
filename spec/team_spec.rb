require 'spec_helper'

RSpec.describe TeamFactory do

  it 'exists' do
    team = Team.new({team_id: 1, franchiseid: 23, team_name: "Atlanta United", abbreviation: "ATL", stadium: "Mercedes-Benz Stadium", link: "/api/v1/teams/1"})
    expect(team).to be_a Team
  end

  it "has attributes from CSV header" do
    team_factory = TeamFactory.new
    team_1 = Team.new({team_id: 1, franchise_id: 23, team_name: "Atlanta United", abbreviation: "ATL", stadium: "Mercedes-Benz Stadium", link: "/api/v1/teams/1"})
    
    binding.pry
    expect(team_1.team_id).to eq 1
    expect(team_1.franchise_id).to eq 23
    expect(team_1.team_name).to eq "Atlanta United"
    expect(team_1.abbreviation).to eq "ATL"
    expect(team_1.stadium).to eq "Mercedes-Benz Stadium"
    expect(team_1.link).to eq "/api/v1/teams/1"
  end

end