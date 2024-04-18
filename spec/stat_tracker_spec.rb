require "spec_helper"

RSpec.describe StatTracker do
  before(:each) do
    games_file = "./data/games.csv"
    teams_file = "./data/teams.csv"
    game_teams_file = "./data/game_teams.csv"

    locations = {
      games: games_file,
      teams: teams_file,
      game_teams: game_teams_file
    }

    @stat_tracker = StatTracker.from_csv(locations)
  end

  describe "#initialize" do
    it "exists" do
      expect(@stat_tracker).to be_an_instance_of(StatTracker)
    end
  end

  describe "::from_csv" do
    it "creates Game Objects from CSV file" do
      expect(@stat_tracker.games.first).to be_an_instance_of(Game)
    end

    it "creates Team Objects from CSV file" do
      expect(@stat_tracker.teams.first).to be_an_instance_of(Team)
    end

    it "creates GameTeam Objects from CSV file" do
      expect(@stat_tracker.game_teams.first).to be_an_instance_of(GameTeam)
    end
  end

  describe "#highest_total_score" do
    it "returns the highest total score" do
      expect(@stat_tracker.highest_total_score).to eq(11)
    end
  end

  describe "#lowest_total_score" do
    it "returns the lowest total score" do
      expect(@stat_tracker.lowest_total_score).to eq(0)
    end
  end

  describe "#percentage_home_wins" do
    it "returns percentage home wins" do
      expect(@stat_tracker.percentage_home_wins).to eq(0.44)
    end
  end

  describe "#percentage_visitor_wins" do
    it "returns percentage visitor wins" do
      expect(@stat_tracker.percentage_visitor_wins).to eq(0.36)
    end
  end

  describe "#winningest_coach" do
    it "returns the coach's name with the highest win percentage for specified season" do
      expect(@stat_tracker.winningest_coach("20132014")).to eq("Claude Julien")
      expect(@stat_tracker.winningest_coach("20142015")).to eq("Alain Vigneault")
    end
  end
end