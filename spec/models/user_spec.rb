require "rails_helper"

RSpec.describe User, type: :model do
  describe "a valid user" do
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:role) }
    it { should define_enum_for(:role) }
    it { should have_many(:points) }
  end
end
