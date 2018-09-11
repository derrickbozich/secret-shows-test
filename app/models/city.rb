class City < ApplicationRecord
  has_many :city_venues
  has_many :venues, through: :city_venues
  has_many :city_shows
  has_many :shows, through: :city_shows

  validates :name, presence: true

  def self.alphabetize
    result = City.all.sort_by {|city| city.name}
  end

    
end
