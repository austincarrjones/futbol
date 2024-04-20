require "spec_helper"

RSpec.describe GameTeam do

  describe "initialize" do
      it "exists" do
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

          @gameteam_test = GameTeam.new(gameteam_data)

          expect(@gameteam_test).to be_an_instance_of(GameTeam)
      end
    end

  describe "GameTeam Class Methods" do
    before(:all) do
        GameTeamFactory.create_game_teams("./fixtures/game_teams_fixture.csv")
        # GameTeamFactory.create_game_teams("./data/game_teams.csv")
        #run with real data too
    end

    describe "::all_game_teams" do
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

    describe "::winningest_coach" do
      it "returns the coach's name with the highest win percentage for specified season" do
        expect(GameTeam.winningest_coach("20132014")).to eq("Mike Yeo")
        expect(GameTeam.winningest_coach("20142015")).to eq("Alain Vigneault")
      end
    end

    describe "::worst_coach" do
      it "returns the coach's name with the lowest win percentage for specified season" do
        expect(GameTeam.worst_coach("20132014")).to eq("Patrick Roy")
        expect(GameTeam.worst_coach("20142015")).to eq("Mike Johnston")
      end
    end

    describe "#tackles_per_team - helper" do
      it "returns the name of the team and the amount of tackles for each - 20132014" do
        expected = {
          "FC Cincinnati" => 299,
          "Orlando City SC" => 194,
          "Real Salt Lake" => 272,
          "Vancouver Whitecaps FC" => 188
        }

        expect(GameTeam.tackles_per_team("20132014")).to eq(expected)
      end
    end

    describe "::most_tackles" do
      it "returns the name of the team with the most tackles for specified season" do
        expect(GameTeam.most_tackles("20132014")).to eq("FC Cincinnati")
        expect(GameTeam.most_tackles("20142015")).to eq("Houston Dynamo")
      end
    end

    describe "::fewest_tackles" do
      it "returns the name of the team with the most tackles for specified season" do
        expect(GameTeam.fewest_tackles("20132014")).to eq("Vancouver Whitecaps FC")
        expect(GameTeam.fewest_tackles("20142015")).to eq("Sporting Kansas City")
      end
    end

    describe "#total_goals_per_team - helper" do
      it 'return hash of total goals per team' do
        expect(GameTeam.total_goals_per_team).to eq({5=>5, 3=>24, 14=>17, 0=>0, 30=>27, 21=>12, 19=>10, 9=>10, 8=>10, 26=>17, 24=>13})
      end
    end

    describe "#total_games_per_team - helper" do
      it 'return hash of total games per team' do
        expect(GameTeam.total_games_per_team).to eq({5=>4, 3=>11, 14=>7, 0=>4, 30=>13, 21=>7, 19=>6, 9=>6, 8=>6, 26=>7, 24=>7})
      end
    end
    
  end
end