# README
rails g model User name:string --no-test-framework
rails g resource City name:string --no-test-framework
rails g resource Venue name:string city_id:integer --no-test-framework
rails g resource Show name:string venue_id:integer --no-test-framework
rails g resource Artist name:string --no-test-framework
rails g migration create_show_artist show_id:integer artist_id:integer --no-test-framework

rails d model User
rails d resource Venue
rails d resource Show
rails d resource Artist
rails d resource City
rails d resource ShowArtist

rake db:drop :shows
rake db:drop :venues
rake db:drop :artists
rake db:drop :show_artists
rake db:drop :cities

show  has_many :show_artists  has_many artists through show_artists    belongs_to :venue
id               venue_id
1                1
1                1

show_artists
id       show_id          artist_id
1        1                1
2        1                2

artist has_many :show_artists has_many shows through show_artists
id  
1

venue has_many :shows belongs_to :city
id        city_id
1         1

city has_many :venues has_many :shows through :venues
id    



user
id         



This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
