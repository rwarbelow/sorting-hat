class User < ActiveRecord::Base
  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :role, presence: true
  enum role: [:default, :admin]
end
