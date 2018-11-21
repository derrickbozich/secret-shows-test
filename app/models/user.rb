class User < ApplicationRecord
  has_many :shows

  has_secure_password
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
end
