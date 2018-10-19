class CitySerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :shows
end
