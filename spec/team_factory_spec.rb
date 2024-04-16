require 'spec_helper'

RSpec.describe TeamFactory do

  it 'exists' do
    team_factory = TeamFactory.new
    expect(team).to be_a TeamFactory
  end

  it 'can create teams' do
    team_factory = TeamFactory.new
    teams = team_factory.create_teams
    binding.pry
  end

  xit "has attributes of id, name, and pet_owner_id" do
    expect()
  end

end