class ShowVenue < ApplicationRecord
  belongs_to :show
  belongs_to :venue
end
