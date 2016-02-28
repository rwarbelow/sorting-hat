require "rails_helper"

RSpec.feature "User cannot create reward" do
  scenario "sees error page after trying to access new reward" do
    username = "harry"
    password = "hedwig"
    create_user(username, password)
    login(username, password)

    visit new_reward_path

    expect(page).to have_content "The page you were looking for doesn't exist."
  end

  scenario "see error page if not logged in to create new reward" do
    visit new_reward_path

    expect(page).to have_content "The page you were looking for doesn't exist."
  end
end
