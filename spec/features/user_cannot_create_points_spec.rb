require "rails_helper"

RSpec.feature "user cannot create points" do
  scenario "user sees an error" do
    username = "echen"
    password = "password"
    user = create_user(username, password)
    login(username, password)

    visit new_user_point_path(user)
    expect(page).to have_content("The page you were looking for doesn't exist.")
  end
end
