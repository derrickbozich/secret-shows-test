# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
u = User.create!(:name => "derrick", :email => 'a', :password => 'a')

s = Show.find_or_create_by(name: "David Bowie at Earl's Court")
v = Venue.find_or_create_by(name: "Earl's Court")
c = City.find_or_create_by(name: "London")
a = Artist.find_or_create_by(name: "David Bowie")
aa = Artist.find_or_create_by(name: "Television")


s.city = c
s.artists << a
s.artists << aa
s.venue = v
s.date = Date.today + (rand * 21)
a.image = 'http://www.davidbowieworld.nl/wp-content/uploads/2014/08/david-bowie-1978-300x300.jpg'
aa.image = 'https://upload.wikimedia.org/wikipedia/en/a/af/Marquee_moon_album_cover.jpg'
s.poster = 'https://cdn.shopify.com/s/files/1/0140/7312/products/david_bowie_legends_series_a39fb2d5-316b-4031-9ece-27410ff5f0e1.jpg?v=1474157681'
s.user_id = u.id
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
s.poster = 'http://cromeyellow.com/wp-content/uploads/2013/06/jaime_cervantes_daft_punk.jpg'
s.user_id = u.id
a.save
aa.save

s.save

s = Show.find_or_create_by(name: "Fever Ray at Red Rocks")
v = Venue.find_or_create_by(name: "Red Rocks")
c = City.find_or_create_by(name: "Denver")
a = Artist.find_or_create_by(name: "Fever Ray")
aa = Artist.find_or_create_by(name: "Tears For Fears")

s.city = c
s.artists << a
s.artists << aa
s.venue = v
s.date = Date.today + (rand * 21)
aa.image = 'https://photos.bandsintown.com/thumb/8209771.jpeg'
a.image = 'https://photos.bandsintown.com/thumb/8248251.jpeg'
s.poster = 'https://afterdark.co/uploads/events/cc520bc2891f990f4df122aa16234817'
s.user_id = u.id
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
s.poster = 'https://d9nvuahg4xykp.cloudfront.net/-2755103181664130548/4720790216666622691.jpg'
s.user_id = u.id
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
s.poster = 'https://11vbnxvrnu2319ljq2tikgn1-wpengine.netdna-ssl.com/wp-content/uploads/2015/10/beach-house-melbourne-2016-tour-poster.jpg'
s.user_id = u.id

a.image = 'https://photos.bandsintown.com/thumb/8597665.jpeg'
aa.image = 'https://photos.bandsintown.com/thumb/8747678.jpeg'

a.save
aa.save

s.save


s = Show.find_or_create_by(name: "Radiohead at The Warfield")
v = Venue.find_or_create_by(name: "The Warfield")
c = City.find_or_create_by(name: "San Francisco")
a = Artist.find_or_create_by(name: "Radiohead")
aa = Artist.find_or_create_by(name: "Stereolab")

s.city = c
s.artists << a
s.artists << aa
s.venue = v
s.date = Date.today + (rand * 21)
s.user_id = u.id
s.poster = 'https://cdn.shopify.com/s/files/1/0140/7312/products/radiohead.jpg?v=1341544721'
a.image = 'https://photos.bandsintown.com/thumb/8836215.jpeg'
aa.image = 'https://photos.bandsintown.com/thumb/120133.jpeg'

a.save
aa.save

s.save



s = Show.find_or_create_by(name: "The Velvet Undergroud at The Ogden")
v = Venue.find_or_create_by(name: "The Ogden")
c = City.find_or_create_by(name: "Denver")
a = Artist.find_or_create_by(name: "The Velvet Underground")
aa = Artist.find_or_create_by(name: "My Bloody Valentine")
s.city = c
s.artists << a
s.artists << aa
s.venue = v
s.date = Date.today + (rand * 21)
s.user_id = u.id

a.image = 'https://media.sundazed.com/media/images/S7002_VU_box_set_mini.jpg'
s.poster = 'https://cdn.shopify.com/s/files/1/0140/7312/products/velvet_underground_3.jpg?v=1451968556'
aa.image = 'https://photos.bandsintown.com/thumb/317697.jpeg'

a.save
aa.save

s.save
