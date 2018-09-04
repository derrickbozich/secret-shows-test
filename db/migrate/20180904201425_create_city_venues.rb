class CreateCityVenues < ActiveRecord::Migration[5.2]
  def change
    create_table :city_venues do |t|
      t.integer :city_id
      t.integer :venue_id

    end
  end
end
