require 'spec_helper'

RSpec.describe TeamFactory do

  it 'exists' do
    team_factory = TeamFactory.new
    expect(team_factory).to be_a TeamFactory
  end

 it 'can create teams' do
    team_factory = TeamFactory.new
    teams = team_factory.create_teams
    expect(teams).to all be_a(Team)
  end

  it "#count_of_teams" do
    team_factory = TeamFactory.new
    team_factory.create_teams
    binding.pry
    expect(team_factory.count_of_teams).to eq 32
  end

end