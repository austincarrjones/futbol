require 'simplecov'

SimpleCov.start

RSpec.configure do |config|
    config.formatter = :documentation
end

require 'pry'
require "./lib/game_team_factory"
require "./lib/game_team"