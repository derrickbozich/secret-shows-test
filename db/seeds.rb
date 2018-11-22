# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
u = User.create!(:name => "derrick", :email => 'dbozich@icloud.com', :password => '123456')

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

s = Show.find_or_create_by(name: "Depeche Mode at The Rose Bowl")
v = Venue.find_or_create_by(name: "The Rose Bowl")
c = City.find_or_create_by(name: "Los Angeles")
a = Artist.find_or_create_by(name: "Depeche Mode")
aa = Artist.find_or_create_by(name: "OMD")

s.city = c
s.artists << a
s.artists << aa
s.venue = v
s.date = Date.today + (rand * 21)
a.image = 'https://upload.wikimedia.org/wikipedia/en/3/38/Depeche_mode_people_are_people_1984.jpg'
aa.image = 'https://thumbnailer.mixcloud.com/unsafe/600x600/extaudio/d/f/d/b/67f6-8551-4cb0-b813-3af2ec7f9095'
s.poster = 'https://cdn.shopify.com/s/files/1/0140/7312/products/depeche_mode.jpg?v=1453250105'
s.user_id = u.id
a.save
aa.save

s.save

s = Show.find_or_create_by(name: "The Clash at Maxwell Hall")
v = Venue.find_or_create_by(name: "Maxwell Hall")
c = City.find_or_create_by(name: "London")
a = Artist.find_or_create_by(name: "The Clash")
aa = Artist.find_or_create_by(name: "Tears For Fears")

s.city = c
s.artists << a
s.artists << aa
s.venue = v
s.date = Date.today + (rand * 21)
aa.image = 'https://photos.bandsintown.com/thumb/8209771.jpeg'
a.image = 'https://media.pitchfork.com/photos/59298f7213d1975652136b20/1:1/w_300/9513b3de.jpg'
s.poster = 'https://cdn.shopify.com/s/files/1/0140/7312/products/the_clash_2.jpg?v=1443380813'
s.user_id = u.id
a.save
aa.save

s.save

# s = Show.find_or_create_by(name: "Ladytron at Razzmatazz")
# v = Venue.find_or_create_by(name: "The Razzmatazz")
# c = City.find_or_create_by(name: "Barcelona")
# a = Artist.find_or_create_by(name: "Ladytron")
# aa = Artist.find_or_create_by(name: "Glass Candy")
#
# s.city = c
# s.artists << a
# s.artists << aa
# s.venue = v
# s.date = Date.today + (rand * 21)
# a.image = 'https://photos.bandsintown.com/thumb/6038183.jpeg'
# aa.image = 'https://photos.bandsintown.com/thumb/7255678.jpeg'
# s.poster = 'https://d9nvuahg4xykp.cloudfront.net/-2755103181664130548/4720790216666622691.jpg'
# s.user_id = u.id
# a.save
# aa.save
#
# s.save

s = Show.find_or_create_by(name: "Blondie at CGBG")
v = Venue.find_or_create_by(name: "CGBG")
c = City.find_or_create_by(name: "New York City")
a = Artist.find_or_create_by(name: "Blondie")
aa = Artist.find_or_create_by(name: "Sound of Ceres")

s.city = c
s.artists << a
s.artists << aa
s.venue = v
s.date = Date.today + (rand * 21)
s.poster = 'https://cdn.shopify.com/s/files/1/0140/7312/products/blondie.gif?v=1481334417'
s.user_id = u.id

a.image = 'https://www.tshirtgrill.com/blog/wp-content/uploads/2015/09/Blondie-300x300.jpg'
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



s = Show.find_or_create_by(name: "The Velvet Underground at The Ogden")
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
