ENV['RAILS_ENV'] = 'test'
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"

# To add Capybara feature tests add `gem "minitest-rails-capybara"`
# to the test group in the Gemfile and uncomment the following:
# require "minitest/rails/capybara"

require "minitest/pride"
require "minitest/reporters"
require "minitest/autorun"
class ActiveSupport::TestCase
  Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
  ActiveRecord::Migration.check_pending!
  fixtures :all

  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
end

class ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  def create_user_and_login(email: "user@example.com", password: "youllneverguess")
    u = User.create!(email: email, password: password, password_confirmation: password, roles: :user)
    sign_in(u) 
  end

  def create_admin_and_login(email: "user@example.com", password: "youllneverguess")
    u = User.create!(email: email, password: password, password_confirmation: password, roles: :root_admin)
    sign_in(u) 
  end

  def create_company_admin_and_login(email: "user@example.com", password: "youllneverguess")
    u = User.create!(email: email, password: password, password_confirmation: password, roles: :company_admin)
    sign_in(u) 
  end
end
