class Reward < ActiveRecord::Base
  has_many :reward_users
  validates :name, presence: true, uniqueness: true
  validates :cost, presence: true
  has_many :users, through: :reward_users

  def format_name
    name.tr(" ", "-")
  end
end
