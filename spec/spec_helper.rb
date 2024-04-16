require 'simplecov'
require 'CSV'
require './lib/team_factory'

SimpleCov.start

RSpec.configure do |config|
    config.formatter = :documentation
end

require 'pry'