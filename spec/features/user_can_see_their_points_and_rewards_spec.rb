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
    end
  end

  scenario "if not logged in, get the 404 page" do
    username = "harry"
    password = "hedwig"
    harry = create_user(username, password)
    harry.points.create(value: 4000)
    harry.rewards.create(name: "Golden Snitch", cost: 25)

    visit user_path(harry.id)

    expect(page).not_to have_content "Welcome harry!"
    expect(page).not_to have_content "Total points: 4000"
    expect(page).not_to have_content "Golden Snitch"
    expect(page).to have_content "The page you were looking for doesn't exist."
  end
end
