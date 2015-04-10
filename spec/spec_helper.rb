# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] = 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'capybara/rspec'
require 'headless'
require 'selenium-webdriver'
#require 'database_cleaner'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|

  Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app, :browser => :firefox)
  end
  Capybara.javascript_driver = :selenium

  config.before(:suite) do
    # DatabaseCleaner.strategy = :truncation
    # DatabaseCleaner.clean_with(:truncation)
    # Use the headless gem to manage your Xvfb server
    @xvfb_headless = Headless.new
    @xvfb_headless.start
  end

  config.after(:suite) do
    # No more Xvfb server!
    @xvfb_headless.destroy
  end

  # == Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr
  config.mock_with :rspec

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  #config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  # config.use_transactional_fixtures = false

  # config.before(:each) do
  #   DatabaseCleaner.start
  # end

  # config.after(:each) do
  #   DatabaseCleaner.clean
  # end
end

# require 'capybara/rspec'
# require 'capybara/dsl'

# Capybara.configure do |config|
#   config.run_server = false
#   config.default_driver = :selenium
#   config.app_host = 'http://www.google.com'
# end
# RSpec.configure do |config|
#   config.include Capybara::DSL
# end
