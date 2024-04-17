require 'simplecov'

SimpleCov.start

RSpec.configure do |config|
    config.formatter = :documentation
end

require 'csv'
require 'pry'
require './lib/game'
require "./lib/game_team"
require "./lib/game_team_factory"
require './lib/game_factory'
