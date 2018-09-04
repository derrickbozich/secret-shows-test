class Artist < ApplicationRecord
  has_many :show_artists
  has_many :shows, through: :show_artists
end
