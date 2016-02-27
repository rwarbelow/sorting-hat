require "rails_helper"

RSpec.feature "Admin can destroy points" do
  scenario "goes to specific user and removes points" do
    username = "allan"
    password = "password"
    create_user(username, password, 1)
    draco = User.create(username: "Draco", password: "slytherinrules", role: 0)
    5.times do |n|
      Point.create(value: (n + 1) * 100, user: draco)
    end
    login(username, password)

    click_on "Draco"

    click_on "Delete 500 points"

    within("#points") do
      expect(page).not_to have_content "500"
    end
  end
end
