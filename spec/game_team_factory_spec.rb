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

  describe "#coach_game_count - helper" do
    it "returns a Hash of the number of games a coach played for a specified season" do
      expected = {
        "John Tortorella" => 5,
        "Claude Julien" => 9,
        "Dan Bylsma" => 4,
        "Mike Babcock" => 1,
        "Joel Quenneville" => 1
      }

      expect(GameTeam.coach_game_count("2012")).to eq(expected)
    end
  end
end