class CityVenue < ApplicationRecord
  belongs_to :city
  belongs_to :venue
end
