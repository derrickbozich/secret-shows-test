json.artists do
  json.array!(@artists) do |artist|
    json.name artist.name
    json.url  artist_path(artist)
  end
end

json.cities do
  json.array!(@cities) do |city|
    json.name city.name
    json.url  city_path(city)
  end
end
