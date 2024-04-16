require 'simplecov'
require 'CSV'
require './lib/team_factory'
require './lib/team'

SimpleCov.start

RSpec.configure do |config|
    config.formatter = :documentation
end

require 'pry'