class ShowSerializer < ActiveModel::Serializer
  attributes :id, :name, :date, :time, :poster
  has_one :city
end
