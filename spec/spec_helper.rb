require 'bundler/setup'
require_relative '../lib/game_of_life'

RSpec.configure do |config|
  config.example_status_persistence_file_path = '.rspec_status'
  config.disable_monkey_patching!
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
  config.profile_examples = 10
end
