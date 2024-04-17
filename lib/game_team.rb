class GameTeam
  attr_reader :game_id,
              :team_id,
              :hoa,
              :result,
              :settled_in,
              :head_coach,
              :goals,
              :shots,
              :tackles,
              :pim,
              :ppo,
              :ppg,
              :faceoff_win_per,
              :giveaways,
              :takeaways

    def initialize(gameteam_data)
        @game_id = gameteam_data[:game_id].to_s
        @team_id = gameteam_data[:team_id].to_s
        @hoa = gameteam_data[:hoa]
        @result = gameteam_data[:result]
        @settled_in = gameteam_data[:settled_in]
        @head_coach = gameteam_data[:head_coach]
        @goals = gameteam_data[:goals]
        @shots = gameteam_data[:shots]
        @tackles = gameteam_data[:tackles]
        @pim = gameteam_data[:pim]
        @ppo = gameteam_data[:ppo]
        @ppg = gameteam_data[:ppg]
        @faceoff_win_per = gameteam_data[:faceoff_win_per]
        @giveaways = gameteam_data[:giveaways]
        @takeaways = gameteam_data[:takeaways]
    end
end