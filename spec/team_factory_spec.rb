require 'spec_helper'

RSpec.describe TeamFactory do

  it 'exists' do
    team_factory = TeamFactory.new
    expect(team_factory).to be_a TeamFactory
  end

  it 'can create teams' do
    teams = TeamFactory.create_teams('./data/teams.csv')
    expect(teams).to all be_a(Team)
  end

  it 'can show all teams' do
    TeamFactory.new
    teams = TeamFactory.create_teams("./data/teams.csv")

    expect(teams).to eq(TeamFactory.all_teams)
  end

  it 'can reset the teams class variable' do
    TeamFactory.new
    teams = TeamFactory.create_teams("./data/teams.csv")
    TeamFactory.reset_teams

    expect(TeamFactory.all_teams).to eq([])
  end
end