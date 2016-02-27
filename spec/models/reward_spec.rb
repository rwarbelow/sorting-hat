require 'rails_helper'

RSpec.describe Reward, type: :model do
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }
  it { should validate_presence_of :cost }
end
