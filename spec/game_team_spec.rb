require "spec_helper"

RSpec.describe GameTeam do
  before(:each) do
    gameteam_data = {
        game_id: "2012030221",
        team_id: "3",
        hoa: "away",
        result: "LOSS",
        settled_in: "OT",
        head_coach: "John Tortorella",
        goals: 2,
        shots: 8,
        tackles: 44,
        pim: 8,
        ppo: 3,
        ppg: 0,
        faceoff_win_per: 44.8,
        giveaways: 17,
        takeaways: 7
    }
    @gameteam_attr_test = GameTeam.new(gameteam_data)
  end

  describe "initialize" do
      it "exists" do
          expect(@gameteam_attr_test).to be_an_instance_of(GameTeam)
      end

      it "has readable attributes" do
          expect(@gameteam_attr_test.game_id).to eq("2012030221")
          expect(@gameteam_attr_test.team_id).to eq("3")
          expect(@gameteam_attr_test.hoa).to eq("away")
          expect(@gameteam_attr_test.result).to eq("LOSS")
          expect(@gameteam_attr_test.settled_in).to eq("OT")
          expect(@gameteam_attr_test.head_coach).to eq("John Tortorella")
          expect(@gameteam_attr_test.goals).to eq(2)
          expect(@gameteam_attr_test.shots).to eq(8)
          expect(@gameteam_attr_test.tackles).to eq(44)
          expect(@gameteam_attr_test.pim).to eq(8)
          expect(@gameteam_attr_test.ppo).to eq(3)
          expect(@gameteam_attr_test.ppg).to eq(0)
          expect(@gameteam_attr_test.faceoff_win_per).to eq(44.8)
          expect(@gameteam_attr_test.giveaways).to eq(17)
          expect(@gameteam_attr_test.takeaways).to eq(7)
      end
    end

  describe "GameTeam Class Methods" do
    before(:all) do
        GameTeamFactory.create_from_csv("./fixtures/game_teams_fixture.csv")
        # GameTeamFactory.create_from_csv("./data/game_teams.csv")
        #run with real data too
    end

    describe "#all_game_teams" do
      it "returns all game_team objects from Factory" do
        expect(GameTeam.all_game_teams).to be_a(Array)
        expect(GameTeam.all_game_teams.length).to eq(78)
        expect(GameTeam.all_game_teams).to all be_a(GameTeam)
      end
    end

    describe "#coach_game_count - helper" do
      it "returns a Hash of the number of games a coach played for a specified season" do
        expected = {
          "Bruce Boudreau" => 7,
          "Darryl Sutter" => 7,
          "Mike Yeo" => 7,
          "Patrick Roy" => 7,
        }

        expect(GameTeam.coach_game_count("20132014")).to eq(expected)

        expected = {
          "Alain Vigneault" => 11,
          "Dave Cameron" => 6,
          "Jon Cooper" => 7,
          "Ken Hitchcock" => 6,
          "Michel Therrien" => 6,
          "Mike Johnston" => 4,
          "Mike Yeo" => 6
        }

        expect(GameTeam.coach_game_count("20142015")).to eq(expected)
      end
    end

    describe "#coach_win_count - helper" do
      it "returns a Hash of the number of games a coach won for a specified season" do
        expected = {
          "Bruce Boudreau" => 2,
          "Darryl Sutter" => 5,
          "Mike Yeo" => 5,
          "Patrick Roy" => 1,
        }

        expect(GameTeam.coach_win_count("20132014")).to eq(expected)

        expected = {
          "Alain Vigneault" => 7,
          "Dave Cameron" => 3,
          "Jon Cooper" => 4,
          "Ken Hitchcock" => 2,
          "Michel Therrien" => 3,
          "Mike Yeo" => 3
        }

        expect(GameTeam.coach_win_count("20142015")).to eq(expected)
      end
    end

    describe "#winningest_coach" do
      it "returns the coach's name with the highest win percentage for specified season" do
        expect(GameTeam.winningest_coach("20132014")).to eq("Mike Yeo")
        expect(GameTeam.winningest_coach("20142015")).to eq("Alain Vigneault")
      end
    end
  end
end