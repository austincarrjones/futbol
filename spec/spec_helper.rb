require 'simplecov'
require 'csv'
require 'pry'
require "./lib/game_team_factory"
require "./lib/game_team"
require "./lib/stat_tracker"

SimpleCov.start

RSpec.configure do |config|
    config.formatter = :documentation
end