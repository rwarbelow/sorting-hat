require "rails_helper"

RSpec.feature "User redeems points and they are not destroyed" do
  scenario "admin will still see total points" do
    username = "harry"
    password = "password"
    user = create_user(username, password)
    admin_username = "allan"
    admin_password = "password"
    create_user(admin_username, admin_password, 1)
    login(username, password)
    Reward.create(name: "Golden Snitch", cost: 10)
    user.points.create(value: 30)
    click_on "Redeem points"
    click_on "Buy Golden Snitch"
    logout

    visit "/"

    click_on "Login"

    fill_in "Username", with: admin_username
    fill_in "Password", with: admin_password
    click_on "Login"

    click_on "List users"

    expect(page).to have_content "Total: 30"
  end
end
