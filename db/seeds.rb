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


s.city = c
s.artists << a
s.venue = v

s.save
