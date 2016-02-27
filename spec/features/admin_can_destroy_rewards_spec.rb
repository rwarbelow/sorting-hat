RSpec.feature "Admin can destroy reward" do
  scenario "admin will not see the reward" do
    username = "allan"
    password = "password"
    create_user(username, password, 1)
    login(username, password)
    Reward.create(name: "Golden Snitch", cost: 10)

    click_on "List rewards"

    click_on "Golden Snitch"

    click_on "Delete"

    expect(page).to_not have_content("Golden Snitch")
  end
end
