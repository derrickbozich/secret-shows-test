class ShowArtist < ApplicationRecord
  belongs_to :show
  belongs_to :artist
end
