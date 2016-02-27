RSpec.feature "User can redeem points for a reward" do
  scenario "views reward in their dashboard" do
    username = "harry"
    password = "password"
    user = create_user(username, password)
    login(username, password)
    Reward.create(name: "Golden Snitch", cost: 10)
    user.points.create(value: 30)

    click_on "Redeem points"

    click_on "Buy Golden Snitch"

    within("#rewards") do
      expect(page).to have_content("Golden Snitch")
    end

    expect(page).to have_content("Total points: 20")
  end
end
