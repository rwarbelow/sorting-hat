require "rails_helper"

RSpec.feature "User cannot other user points" do
  scenario "user sees error page" do
    username = "harry"
    password = "password"
    user = create_user(username, password)
    login(username, password)
    Reward.create(name: "Golden Snitch", cost: 10)
    user.points.create(value: 30)

    other_username = "jack"
    other_password = "password"
    other_user = create_user(other_username, other_password)

    visit user_rewards_path(other_user.id)

    expect(page).to have_content "The page you were looking for doesn't exist."
    logout
  end
end
