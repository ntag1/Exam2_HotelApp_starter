require 'simplecov'
SimpleCov.start 'rails'
ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest"
require 'minitest/rails'
require 'minitest/reporters'
require 'minitest_extensions'
require 'contexts'

class ActiveSupport::TestCase

  include Contexts # calling all the methods define in contexts.rb
  Minitest::Reporters.use! [Minitest::Reporters::SpecReporter.new]

  Shoulda::Matchers.configure do |config|
    config.integrate do |with|
        with.test_framework :minitest
        with.library :rails
    end
end 
end
