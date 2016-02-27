require "rails_helper"

RSpec.feature "User can only see their account details" do
  before(:each) do
    @draco = create_user("draco", "slytherinrules")
    @harry = create_user("harry", "hedwig")
  end

  context "when user is logged in" do
    it "tries to access other users path" do
      login("draco", "slytherinrules")

      visit user_path(@harry.id)

      expect(page).to have_content("The page you were looking for doesn't exist.")
    end

    it "tries to access the users page through admin access" do
      login("draco", "slytherinrules")

      visit admin_user_path(@harry.id)

      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end

  context "when user is not logged in" do
  end
end
