RSpec.feature "User can see rewards" do
  scenario "user views list of rewards" do
    username = "echen"
    password = "password"
    create_user(username, password)
    login(username, password)
    reward_name = "Golden Snitch"
    reward_cost = 10
    Reward.create(name: reward_name, cost: reward_cost)

    click_on "Redeem points"

    within("#Golden-Snitch") do
      expect(page).to have_content reward_name
      expect(page).to have_content reward_cost
    end
    logout
  end
end
