require "spec_helper"

RSpec.describe GameTeam do

  describe "initialize" do
      it "exists" do
          gameteam_data = {
          game_id: "2012030221",
          team_id: "3",
          hoa: "away",
          result: "LOSS",
          head_coach: "John Tortorella",
          goals: 2,
          shots: 8,
          tackles: 44
        }   

          @gameteam_test = GameTeam.new(gameteam_data)

          expect(@gameteam_test).to be_an_instance_of(GameTeam)
      end
    end

  describe "GameTeam Class Methods" do
    before(:all) do
        GameTeamFactory.create_game_teams("./fixtures/game_teams_fixture.csv")
    end

    describe "::all_game_teams" do
      it "returns all game_team objects from Factory" do
        expect(GameTeam.all_game_teams).to be_a(Array)
        expect(GameTeam.all_game_teams.length).to eq(78)
        expect(GameTeam.all_game_teams).to all be_a(GameTeam)
      end
    end

    describe "::coach_game_count - helper" do
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

    describe "::coach_win_count - helper" do
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

    describe "::tackles_per_team - helper" do
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

    describe "::team_id_and_shots - helper" do
      it "returns a hash containing team id pointing to amount of shots for 20132014 season" do
        expected = {
          30=>56, 
          21=>40, 
          26=>49, 
          24=>42
        }

        expect(GameTeam.team_id_and_shots("20132014")).to eq(expected)
      end

      it "returns a hash containing team id pointing to amount of shots for 20142015 season" do
        expected = {
          5=>25, 
          3=>75, 
          14=>51, 
          30=>32, 
          19=>37, 
          9=>47, 
          8=>54
        }

        expect(GameTeam.team_id_and_shots("20142015")).to eq(expected)
      end
    end

    describe "::team_id_and_goals - helper" do
      it "returns a hash containing team id pointing to amount of goals for 20132014 season" do
        expected = {
          30=>16, 
          21=>12, 
          26=>17, 
          24=>13
        }

        expect(GameTeam.team_id_and_goals("20132014")).to eq(expected)
      end

      it "returns a hash containg team id pointing to amount of goals for 20142015 season" do
        expected = {
          5=>5, 
          3=>24, 
          14=>17, 
          30=>11, 
          19=>10, 
          9=>10, 
          8=>10
        }

        expect(GameTeam.team_id_and_goals("20142015")).to eq(expected)
      end
    end

    describe "::team_id_shots_goals_ratio - helper" do
      it "divides teams shots by goals, creates new hash with team_id pointing to ratio - 20132014" do
        expected = {
          30 => 3.5,
          21 => 3.33,
          26 => 2.88,
          24 => 3.23
        }
        expect(GameTeam.team_id_shots_goals_ratio("20132014")).to eq(expected)
      end

      it "divides teams shots by goals, creates new hash with team_id pointing to ratio - 20142015" do
        expected = {
          14 => 3.0,
          19 => 3.7,
          3 => 3.13,
          30 => 2.91,
          5 => 5.0,
          8 => 5.4,
          9 => 4.7
        }
        expect(GameTeam.team_id_shots_goals_ratio("20142015")).to eq(expected)
      end
    end

    describe "::team_id_to_team_name - helper" do
      it "changes keys from team_id to team_name - 20132014" do
        expected = {
          "FC Cincinnati"=>2.88, 
          "Orlando City SC"=>3.5, 
          "Real Salt Lake"=>3.23, 
          "Vancouver Whitecaps FC"=>3.33
        }

        expect(GameTeam.team_id_to_team_name("20132014")).to eq(expected)
      end

      it "changes keys from team_id to team_name - 20142015" do
        expected = {
          "DC United"=>3.0, 
          "Houston Dynamo"=>3.13, 
          "New York City FC"=>4.7, 
          "New York Red Bulls"=>5.4, 
          "Orlando City SC"=>2.91, 
          "Philadelphia Union"=>3.7, 
          "Sporting Kansas City"=>5.0
        }

        expect(GameTeam.team_id_to_team_name("20142015")).to eq(expected)
      end
    end

    describe "::most_accurate_team" do
      it "returns the name of the team with the best ratio of shots to goals for specified season" do
        expect(GameTeam.most_accurate_team("20132014")).to eq("FC Cincinnati")
        expect(GameTeam.most_accurate_team("20142015")).to eq("Orlando City SC")
      end
    end

    describe "::least_accurate_team" do
      it "returns the name of the team with the worst ratio of shots to goals for specified season" do
        expect(GameTeam.least_accurate_team("20132014")).to eq("Orlando City SC") # Houston Dash has same ratio as NYC FC - 3.79
        expect(GameTeam.least_accurate_team("20142015")).to eq("New York Red Bulls")
      end
    end
    
    describe "#total_goals_per_team - helper" do
      it "returns hash of total goals per team" do
        expect(GameTeam.total_goals_per_team).to eq({5=>5, 3=>24, 14=>17, 0=>0, 30=>27, 21=>12, 19=>10, 9=>10, 8=>10, 26=>17, 24=>13})
      end
    end

    describe "#total_games_per_team - helper" do
      it "returns hash of total games per team" do
        expect(GameTeam.total_games_per_team).to eq({5=>4, 3=>11, 14=>7, 0=>4, 30=>13, 21=>7, 19=>6, 9=>6, 8=>6, 26=>7, 24=>7})
      end
    end

    describe "#average_goals_per_game - helper" do
      it "returns hash of teams and their average goals per game" do
        expect(GameTeam.average_goals_per_game).to eq({5=>1.25, 3=>2.18, 14=>2.43, 30=>2.08, 21=>1.71, 19=>1.67, 9=>1.67, 8=>1.67, 26=>2.43, 24=>1.86})
      end
    end

    describe "#best_offense" do
      it "returns team with the highest goals per game" do
        expect(GameTeam.best_offense).to eq("DC United")
      end
    end

    describe "#worst_offense" do
      it "returns team with the lowest goals per game" do
        expect(GameTeam.worst_offense).to eq("Sporting Kansas City")
      end
    end
  end
end