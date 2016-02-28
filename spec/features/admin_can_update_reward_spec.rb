require "rails_helper"

RSpec.feature "Admin can update reward" do
  scenario "admin views show of updated reward" do
    username = "allan"
    password = "password"
    create_user(username, password, 1)
    login(username, password)
    reward_name = "Golden Snitch"
    reward_cost = 10
    Reward.create(name: reward_name, cost: reward_cost)

    click_on "List rewards"

    click_on "Golden Snitch"

    click_on "Edit"

    fill_in "Name", with: "Golden Lich"
    fill_in "Cost", with: reward_cost
    click_on "Update Reward"

    expect(page).to have_content("Golden Lich")
    expect(page).to have_content(reward_cost)
    logout
  end
end
