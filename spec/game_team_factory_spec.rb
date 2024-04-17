require "spec_helper"

RSpec.describe GameTeamFactory do
  describe "#initialize" do
    it "exists" do
      factory = GameTeamFactory.new

      expect(factory).to be_a GameTeamFactory
    end
  end

  describe "#create_from_csv" do
    it "create GameTeam objects from csv file" do
      game_teams = GameTeamFactory.create_from_csv("./fixtures/game_teams_fixture.csv")

      expect(game_teams).to all be_a(GameTeam)
    end
  end
end