require "rails_helper"

RSpec.feature "Admin login" do
  scenario "sees admin dashboard after logging in" do
    username = "allan"
    password = "password"
    create_user(username, password, 1)

    visit "/"
    click_on "Login"

    fill_in "Username", with: username
    fill_in "Password", with: password

    click_on "Login"

    expect(page).to have_content "Welcome allan!"
    expect(page).to have_content "List users"
    logout
  end
end
