require 'spec_helper'

RSpec.describe Game do
  describe 'initialize' do
    it 'exists' do
      game1 = Game.new({game_id: 2012030221, season: 20122013, type: :Postseason, date_time: '2013-05-16', away_team_id: 3, home_team_id: 6, away_goals: 2, home_goals: 3, venue: 'Toyota Stadium', venue_link: '/api/v1/venues/null'})

      expect(game1).to be_a(Game)
    end
  end
end