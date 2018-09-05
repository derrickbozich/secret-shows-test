class City < ApplicationRecord
  has_many :city_venues
  has_many :venues, through: :city_venues
  has_many :city_shows
  has_many :shows, through: :city_shows

  validates :name, presence: true, uniqueness: true
end
