class RewardUser < ActiveRecord::Base
  belongs_to :reward
  belongs_to :user
  validates :user, presence: true
  validates :reward, presence: true
end
