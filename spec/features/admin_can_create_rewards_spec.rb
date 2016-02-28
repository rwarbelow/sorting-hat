require "rails_helper"

RSpec.feature "Admin creates rewards" do
  scenario "admin sees a list of rewards" do
    username = "allan"
    password = "password"
    create_user(username, password, 1)
    login(username, password)

    click_on "List rewards"

    click_on "Create reward"

    fill_in "Name", with: "Golden Snitch"
    fill_in "Cost", with: 10

    click_on "Create Reward"

    within("#Golden-Snitch") do
      expect(page).to have_content("Golden Snitch")
      expect(page).to have_content("Cost: 10")
    end
    logout
  end
end
