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
        @team_id = gameteam_data[:team_id].to_i
        @hoa = gameteam_data[:hoa]
        @result = gameteam_data[:result]
        @settled_in = gameteam_data[:settled_in]
        @head_coach = gameteam_data[:head_coach]
        @goals = gameteam_data[:goals].to_i
        @shots = gameteam_data[:shots]
        @tackles = gameteam_data[:tackles].to_i
        @pim = gameteam_data[:pim]
        @ppo = gameteam_data[:ppo]
        @ppg = gameteam_data[:ppg]
        @faceoff_win_per = gameteam_data[:faceoff_win_per]
        @giveaways = gameteam_data[:giveaways]
        @takeaways = gameteam_data[:takeaways]
    end

    def self.all_game_teams
      GameTeamFactory.all_game_teams
    end

    def self.coach_game_count(season)
      counter = Hash.new(0)

      all_game_teams.each do |game_team|
        if season[0..3] == game_team.game_id[0..3]
          counter[game_team.head_coach] += 1
        end
      end
      counter
    end

    def self.coach_win_count(season)
      counter = Hash.new(0)

      all_game_teams.each do |game_team|
        if season[0..3] == game_team.game_id[0..3] && game_team.result == "WIN"
            counter[game_team.head_coach] += 1
        end
      end
      counter
    end

    def self.winningest_coach(season)
      coach_win_percentage = {}
      coach_win_count_result = coach_win_count(season)

      coach_game_count(season).each do |coach, game_count|
        if coach_win_count_result[coach] == 0
          coach_win_percentage[coach] = 0
        else
          coach_win_percentage[coach] = coach_win_count_result[coach] / game_count.to_f
        end
        coach_win_percentage
      end
        coach_win_percentage.max_by { |coach, percent| percent }.first
    end

    def self.worst_coach(season)
      coach_win_percentage = {}
      coach_win_count_result = coach_win_count(season)

      coach_game_count(season).each do |coach, game_count|
        if coach_win_count_result[coach] == 0
          coach_win_percentage[coach] = 0
        else
          coach_win_percentage[coach] = coach_win_count_result[coach] / game_count.to_f
        end
        coach_win_percentage
      end
      coach_win_percentage.min_by { |coach, percent| percent }.first
    end

    #best_offense
    def self.total_goals_per_team
      goals_per_team = Hash.new(0)
      all_game_teams.each do |game_team|
        goals_per_team[game_team.team_id] += game_team.goals
      end
      goals_per_team
    end

    def self.total_games_per_team
      games_per_team = Hash.new(0)
      all_game_teams.find_all do |game_team|
        games_per_team[game_team.team_id] += 1
      end
      games_per_team
    end

    def self.average_goals_per_game
      average_gpg = Hash.new(0)
      all_game_teams.find_all do |game_team|
        average_gpg[game_team.team_id] = (GameTeam.total_goals_per_team[game_team.team_id].to_f / GameTeam.total_games_per_team[game_team.team_id]).round(2)
      end
      average_gpg
    end
    
    def self.best_offense
      team = self.average_goals_per_game.max_by { |key, value| value }[0]
      #need to translate team_id to team_name
      team
      binding.pry
    end

    #worst offense

    def self.tackles_per_team(season)
      team_name_to_tackles = Hash.new(0)
      teams = TeamFactory.create_teams("./data/teams.csv")
      
      all_game_teams.each do |game_team|
        teams.each do |team|
          if season[0..3] == game_team.game_id[0..3] && team.team_id == game_team.team_id
            team_name_to_tackles[team.team_name] += game_team.tackles
          end
        end
      end
      team_name_to_tackles
    end
    
    def self.most_tackles(season)
      tackles_per_team(season).max_by { |team_name, tackles| tackles }.first
    end
    

    def self.fewest_tackles(season)
      tackles_per_team(season).min_by { |team_name, tackles| tackles }.first
    end

    #most_accurate_team

    #least_accurate_team
end