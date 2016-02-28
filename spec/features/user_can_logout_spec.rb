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

  scenario "can't access personal page after logout" do
    username = "harry"
    password = "hedwig"
    harry = create_user(username, password)
    login(username, password)
    click_on "Logout"

    visit user_path(harry.id)

    expect(page).to have_content("The page you were looking for doesn't exist.")
  end
end
