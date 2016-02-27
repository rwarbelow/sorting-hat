require "simplecov"
SimpleCov.start("rails")

module SpecHelpers

  def create_user(username, password, role = 0)
    User.create(username: username, password: password, role: role)
  end

  def logout
    reset_session!
  end

  def login(username, password)
    visit "/"

    click_on "Login"

    fill_in "Username", with: username
    fill_in "Password", with: password

    click_on "Login"
  end

end


RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.include SpecHelpers
end
