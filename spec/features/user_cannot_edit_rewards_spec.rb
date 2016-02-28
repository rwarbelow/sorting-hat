require "rails_helper"

RSpec.feature "User cannot edit rewards" do
  scenario "sees error page after trying to delete their own reward" do
    username = "harry"
    password = "hedwig"
    harry = create_user(username, password)
    login(username, password)
    broom = harry.rewards.create(name: "janky broom", cost: 5000)

    visit edit_reward_path(broom.id)

    expect(page).to have_content "The page you were looking for doesn't exist."
  end

  scenario "sees error page after trying to delete other user's reward" do
    harry = create_user("harry", "hedwig")
    username = "draco"
    password = "slytherinrules"
    create_user(username, password)
    login(username, password)
    broom = harry.rewards.create(name: "janky broom", cost: 5000)

    visit edit_reward_path(broom.id)

    expect(page).to have_content "The page you were looking for doesn't exist."
  end

  scenario "sees error page trying to delete reward when not logged in" do
    broom = Reward.create(name: "janky broom", cost: 5000)

    visit edit_reward_path(broom.id)

    expect(page).to have_content "The page you were looking for doesn't exist."
  end
end
