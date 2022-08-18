ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"
require "database_cleaner/active_record"
require "database_cleaner/redis"
require  "minitest/pride"

DatabaseCleaner.strategy = :deletion


class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  include Devise::Test::IntegrationHelpers

  module AroundEachTest
    def before_setup
      super
      DatabaseCleaner.start
    end
  
    def after_teardown
      super
      DatabaseCleaner.clean
    end
  end
  
  class Minitest::Test
    include AroundEachTest
  end
  
  
end

