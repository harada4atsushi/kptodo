ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'capybara/rspec'
require 'capybara/rails'
include Capybara::DSL

RSpec.configure do |config|
  config.include Rails.application.routes.url_helpers
end
