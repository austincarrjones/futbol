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

  describe "#percentage_ties" do
    it "returns percentage of games resulting in a tie" do
      expect(@stat_tracker.percentage_ties).to eq(0.20)
    end
  end

  describe "#count_of_games_by_season" do
    it "returns Hash with seasons pointing to the number of games" do
      expected = {
        "20122013"=>806,
        "20162017"=>1317,
        "20142015"=>1319,
        "20152016"=>1321,
        "20132014"=>1323,
        "20172018"=>1355
      }

      expect(@stat_tracker.count_of_games_by_season).to eq(expected)
    end
  end

  describe "#average_goals_per_game" do
    it "returns the average goals per game" do
      expect(@stat_tracker.average_goals_per_game).to eq(4.22)
    end
  end

  describe "#average_goals_by_season" do
    it "returns Hash with season names pointing to average goals scored in games for that season" do
      expected = {
        "20122013"=>4.12,
        "20162017"=>4.23,
        "20142015"=>4.14,
        "20152016"=>4.16,
        "20132014"=>4.19,
        "20172018"=>4.44
      }

      expect(@stat_tracker.average_goals_by_season).to eq(expected)
    end
  end

  describe "#count_of_teams" do
    it "returns the total number of teams in data" do
      expect(@stat_tracker.count_of_teams).to eq(32)
    end
  end

  describe "#winningest_coach" do
    it "returns the coach's name with the highest win percentage for specified season" do
      expect(@stat_tracker.winningest_coach("20132014")).to eq("Claude Julien")
      expect(@stat_tracker.winningest_coach("20142015")).to eq("Alain Vigneault")
    end
  end

  describe "#worst_coach" do
    it "returns the coach's name with the lowest win percentage for specified season" do
      expect(@stat_tracker.worst_coach("20132014")).to eq "Peter Laviolette"
      expect(@stat_tracker.worst_coach("20142015")).to eq("Craig MacTavish").or(eq("Ted Nolan"))
    end
  end

  describe "#most_accurate_team" do
    it "returns the name of the team with the best ratio of shots to goals for specified season" do
      expect(@stat_tracker.most_accurate_team("20132014")).to eq("Real Salt Lake")
      expect(@stat_tracker.most_accurate_team("20142015")).to eq("Toronto FC")
    end
  end

  describe "#least_accurate_team" do
    it "returns the name of the team with the worst ratio of shots to goals for specified season" do
      expect(@stat_tracker.least_accurate_team("20132014")).to eq("New York City FC").or(eq("Houston Dash"))
      expect(@stat_tracker.least_accurate_team("20142015")).to eq("Columbus Crew SC")
    end
  end

  describe "#most_tackles" do
    it "returns the team name with the most tackles for a specified season" do
      expect(@stat_tracker.most_tackles("20132014")).to eq "FC Cincinnati"
      expect(@stat_tracker.most_tackles("20142015")).to eq "Seattle Sounders FC"
    end
  end

  describe "#fewest_tackles" do
    it "returns the team name with the fewest tackles for a specified season" do
      expect(@stat_tracker.fewest_tackles("20132014")).to eq "Atlanta United"
      expect(@stat_tracker.fewest_tackles("20142015")).to eq "Orlando City SC"
    end
  end
end