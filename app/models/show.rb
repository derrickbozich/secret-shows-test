class Show < ApplicationRecord
  has_many :show_artists
  has_many :artists, through: :show_artists
  has_one :show_venue
  has_one :venue, through: :show_venue
  has_one :city_show
  has_one :city, through: :city_show
  belongs_to :user

  validates :name, presence: true




  # accepts_nested_attributes_for :artists

  def venue_name=(name)
    venue = Venue.find_or_create_by(:name => name)
    self.venue = venue
  end

  def venue_name
    self.venue ? self.venue.name : nil
  end

  def city_name=(name)
    city = City.find_or_create_by(:name => name)
    self.city = city
  end

  def city_name
    self.city ? self.city.name : nil
  end



  def artists_attributes=(artists_attributes)
    artists_attributes.each do |artist_attributes|
      begin
        test = artist_attributes['name']
      rescue
        test = nil
      end

      if test
        artist = Artist.find_or_create_by(name: artist_attributes[:name], image: artist_attributes[:image] )
        self.artists << artist
      else
        artist = Artist.find_or_create_by(name: artist_attributes[1][:name], image: artist_attributes[1][:image])unless artist_attributes[1].empty?
        self.artists << artist if artist
      end

    end
  end

  def self.upcoming_shows
    Show.where("date >= ?", Date.today).order('date asc').select do |s|
      s.date.present?
    end
  end

  def self.past_shows
    Show.where("date < ?", Date.today).order('date asc').select do |s|
      s.date.present?
    end
  end



end
