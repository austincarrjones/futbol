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

    def self.coach_game_count(season)
      counter = Hash.new(0)

      GameTeamFactory.all_game_teams.each do |game_team|
        if season[0..3] == game_team.game_id[0..3]
          counter[game_team.head_coach] += 1
        end
      end
      counter
    end

    #winningest_coach

    #worst_coach

    #best_offense

    #worst offense

    #most_tackles

    #fewest_tackles

    #mmost_accurate_team

    #least_accurate_team
end