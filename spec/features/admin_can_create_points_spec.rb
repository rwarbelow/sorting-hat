require "rails_helper"

RSpec.feature "admin can create points" do
  scenario "they create points for a user" do
    username = "snape"
    password = "horace"
    user = create_user("Rachel", "password")
    admin = create_user(username, password, 1)
    login(username, password)

    click_on "List users"

    click_on "Rachel"

    click_on "Create points for Rachel"

    fill_in "Value", with: "100"

    click_on "Create points"

    expect(current_path).to eq(admin_users_path)

    within("#Rachel") do
      expect(page).to have_content("Total: 100")
      expect(page).to have_content("Redeemed: 0")
      expect(page).to have_content("Balance: 100")
    end
    logout
  end
end
