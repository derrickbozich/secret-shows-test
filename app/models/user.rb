class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]
  has_many :shows


  # has_secure_password :validations => false
  # has_secure_password
  # validates_confirmation_of :password, :if => :password_present?
  # validates_presence_of :password, :on => :create, :unless => :google_user?

  # validates :name, presence: true
  # validates :email, presence: true, uniqueness: true

  # validates :password, presence: true



  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

      # Uncomment the section below if you want users to be created if they don't exist
      unless user
          user = User.create(name: data['name'],
             email: data['email'],
             password: Devise.friendly_token[0,20]
          )
      end
      user
  end
end
