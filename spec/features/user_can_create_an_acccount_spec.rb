require "rails_helper"

RSpec.feature "user can create an account" do
  scenario "they create an account" do
    username = "harrypotter"
    password = "hedwig"

    visit "/"
    click_link "Create account"
    fill_in "Username", with: username
    fill_in "Password", with: password

    click_on "Create account"

    expect(page).to have_content("Welcome #{username}!")
    expect(page).to have_content("Created new account!")
    logout
  end

end
