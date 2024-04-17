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
end