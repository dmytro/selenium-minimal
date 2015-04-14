require 'capybara/rspec'
require 'capybara/dsl'

Capybara.configure do |config|
  config.run_server = false
  config.default_driver = :selenium
  config.app_host = 'http://www.google.com'
end
RSpec.configure do |config|
  config.include Capybara::DSL
end

