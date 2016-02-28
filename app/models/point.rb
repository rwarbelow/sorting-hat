class Point < ActiveRecord::Base
  validates :user, presence: true
  belongs_to :user

  def self.total
    where("value > 0").sum(:value)
  end

  def self.redeemed
    where("value < 0").sum(:value)
  end

  def self.balance
    total + redeemed
  end
end
