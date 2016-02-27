class Reward < ActiveRecord::Base
  has_many :reward_users
  validates :name, presence: true, uniqueness: true
  validates :cost, presence: true

  def format_name
    name.gsub(" ", "-")
  end
end
