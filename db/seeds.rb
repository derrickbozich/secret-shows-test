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

s.save
