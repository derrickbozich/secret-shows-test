class Venue < ApplicationRecord
  has_many :show_venues
  has_many :shows, through: :show_venues
  has_one :city_venue
  has_one :city, through: :city_venue

  validates :name, presence: true

  def upcoming_shows
    self.shows.where('date >= ?', Date.today).order('date asc')
  end
end
