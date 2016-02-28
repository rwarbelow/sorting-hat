require "rails_helper"

RSpec.feature "User login" do
  scenario "user enters correct username and password combination" do
    username = "harry"
    password = "hedwig"
    create_user(username, password)

    visit "/"
    click_on "Login"
    fill_in "Username", with: username
    fill_in "Password", with: password
    click_on "Login"

    expect(page).to have_content("Welcome harry!")
  end

  scenario "user enters incorrect username and password combination" do
    username = "harry"
    password = "hedwig"
    create_user(username, password)

    visit "/"
    click_on "Login"
    fill_in "Username", with: username
    fill_in "Password", with: "invalidpassword"
    click_on "Login"

    expect(page).to have_content("Unable to login, please try again.")
    logout
  end
end
