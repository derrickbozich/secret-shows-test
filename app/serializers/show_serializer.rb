class ShowSerializer < ActiveModel::Serializer
  attributes :id, :name, :date, :time, :poster
  has_one :city
  has_one :venue
  has_many :artists
  belongs_to :user
end
