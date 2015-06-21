ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/rails/capybara"

require "minitest/reporters"
Minitest::Reporters.use!

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!
  fixtures :all

  def log_in_as(user)
    visit new_user_session_path
    fill_in 'Email', with: 'memarin@me.com'
    fill_in 'Password', with: 'mem10249'
    click_button 'Log in'
    assert page.has_content?('Signed in successfully.')
  end

end
