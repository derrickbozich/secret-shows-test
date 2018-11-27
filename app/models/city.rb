class City < ApplicationRecord
  has_many :city_venues
  has_many :venues, through: :city_venues
  has_many :city_shows
  has_many :shows, through: :city_shows

  validates :name, presence: true

  def self.alphabetize
    result = City.all.sort_by {|city| city.name}
  end

  def upcoming_shows
    self.shows.where('date >= ? ', Date.today).order('date asc')
  end

  def next_show(show, direction)
    if direction == 'next'
      next_shows = self.shows.where('date >= ? ', show.date).order('date asc').limit(2)
      next_show = (next_shows[0].id == show.id ? next_shows[1] : next_shows[0])
    else
      next_shows = self.shows.where('date <= ? ', show.date).order('date desc').limit(2)
      next_show = (next_shows[0].id == show.id ? next_shows[1] : next_shows[0])
    end
    next_show
  end




end
