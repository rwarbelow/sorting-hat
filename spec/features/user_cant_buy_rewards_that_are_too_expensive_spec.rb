require "rails_helper"

RSpec.feature "User cannot buy rewards that are too expensive" do
  scenario "gets the index page if reward is too expensive" do
    # as a logged in User
    username = "harry"
    password = "potter"
    harry = create_user(username, password)
    Reward.create(name: "Golden Snitch", cost: 5000)
    harry.points.create(value: 30)

    login(username, password)

    click_on "Redeem points"

    click_on "Buy Golden Snitch"

    expect(page).to have_content "Sorry you don't have enough points for that. Go talk to Snape."
    expect(page).to have_content "Golden Snitch"
  end
end
