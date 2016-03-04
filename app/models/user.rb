class User < ActiveRecord::Base
  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :role, presence: true
  enum role: [:default, :admin]
  has_many :points
  has_many :reward_users
  has_many :rewards, through: :reward_users

  def has_points_for?(reward)
    points.balance >= reward.cost
  end

  def process(reward)
    user.rewards << reward
    user.points.create(value: -reward.cost)
  end
end
