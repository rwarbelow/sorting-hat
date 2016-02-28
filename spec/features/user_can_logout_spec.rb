require "rails_helper"

RSpec.feature "User logout" do
  scenario "sees welcome page after logout" do
    username = "harry"
    password = "hedwig"
    create_user(username, password)
    login(username, password)
    expect(page).to have_content "Welcome harry!"

    click_on "Logout"

    expect(current_path).to eq root_path
    expect(page).to have_content "You have successfully logged out"
  end
end
