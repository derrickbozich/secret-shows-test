# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

s = Show.find_or_create_by(name: "Blonde Redhead at The Colliseum")
v = Venue.find_or_create_by(name: "The Colliseum")
c = City.find_or_create_by(name: "Athens")
a = Artist.find_or_create_by(name: "Blonde Redhead")
aa = Artist.find_or_create_by(name: "The Flying Lizards")


s.city = c
s.artists << a
s.artists << aa
s.venue = v
s.date = Date.today + (rand * 21)
a.image = 'https://photos.bandsintown.com/thumb/7617791.jpeg'
aa.image = 'https://photos.bandsintown.com/thumb/6381097.jpeg'

a.save
aa.save

s.save

s = Show.find_or_create_by(name: "Daft Punk at The Palace")
v = Venue.find_or_create_by(name: "The Palace")
c = City.find_or_create_by(name: "Paris")
a = Artist.find_or_create_by(name: "Daft Punk")
aa = Artist.find_or_create_by(name: "Ladytron")

s.city = c
s.artists << a
s.artists << aa
s.venue = v
s.date = Date.today + (rand * 21)
a.image = 'https://photos.bandsintown.com/thumb/226052.jpeg'
aa.image = 'https://photos.bandsintown.com/thumb/6038183.jpeg'

a.save
aa.save

s.save

s = Show.find_or_create_by(name: "Tears For Fears at Red Rocks")
v = Venue.find_or_create_by(name: "Red Rocks")
c = City.find_or_create_by(name: "Denver")
a = Artist.find_or_create_by(name: "Tears For Fears")
aa = Artist.find_or_create_by(name: "Fever Ray")

s.city = c
s.artists << a
s.artists << aa
s.venue = v
s.date = Date.today + (rand * 21)
a.image = 'https://photos.bandsintown.com/thumb/8209771.jpeg'
aa.image = 'https://photos.bandsintown.com/thumb/8248251.jpeg'

a.save
aa.save

s.save

s = Show.find_or_create_by(name: "Ladytron at Razzmatazz")
v = Venue.find_or_create_by(name: "The Razzmatazz")
c = City.find_or_create_by(name: "Barcelona")
a = Artist.find_or_create_by(name: "Ladytron")
aa = Artist.find_or_create_by(name: "Glass Candy")

s.city = c
s.artists << a
s.artists << aa
s.venue = v
s.date = Date.today + (rand * 21)
a.image = 'https://photos.bandsintown.com/thumb/6038183.jpeg'
aa.image = 'https://photos.bandsintown.com/thumb/7255678.jpeg'

a.save
aa.save

s.save

s = Show.find_or_create_by(name: "Beach House at Razzmatazz")
v = Venue.find_or_create_by(name: "The Razzmatazz")
c = City.find_or_create_by(name: "Barcelona")
a = Artist.find_or_create_by(name: "Beach House")
aa = Artist.find_or_create_by(name: "Sound of Ceres")

s.city = c
s.artists << a
s.artists << aa
s.venue = v
s.date = Date.today + (rand * 21)


a.image = 'https://photos.bandsintown.com/thumb/8597665.jpeg'
aa.image = 'https://photos.bandsintown.com/thumb/8747678.jpeg'

a.save
aa.save
