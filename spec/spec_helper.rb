require 'simplecov'

SimpleCov.start

RSpec.configure do |config|
    config.formatter = :documentation
end

require 'pry'
require 'csv'
require './lib/game'
require './lib/game_factory'