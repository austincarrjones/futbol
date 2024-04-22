require 'simplecov'
SimpleCov.start

require 'csv'
require 'pry'
require "./lib/stat_tracker"
require './lib/game'
require "./lib/game_team"
require "./lib/game_team_factory"
require './lib/game_factory'
require './lib/team_factory'
require './lib/team'
require 'date'

RSpec.configure do |config|
    config.formatter = :documentation
end