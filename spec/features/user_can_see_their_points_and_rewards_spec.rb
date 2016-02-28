require "rails_helper"

RSpec.feature "User can see points and rewards" do
  scenario "after logging can see their points and rewards" do
    username = "harry"
    password = "hedwig"
    harry = create_user(username, password)
    harry.points.create(value: 4000)
    harry.rewards.create(name: "Golden Snitch", cost: 25)
    login(username, password)

    expect(page).to have_content "Welcome harry!"
    expect(page).to have_content "Total points: 4000"
    within("#rewards") do
      expect(page).to have_content "Golden Snitch"
      expect(page).to have_content "25"
    end
  end
end
