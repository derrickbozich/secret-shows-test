class User < ApplicationRecord
  has_many :shows

  # has_secure_password :validations => false
  has_secure_password
  # validates_confirmation_of :password, :if => :password_present?
  # validates_presence_of :password, :on => :create, :unless => :google_user?

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  # validates :password, presence: true

  def google_user?
    binding.pry
    # !uid.nil? && !provider.nil?
  end
end
