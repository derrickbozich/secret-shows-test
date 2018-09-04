class CreateCityShows < ActiveRecord::Migration[5.2]
  def change
    create_table :city_shows do |t|
      t.integer :city_id
      t.integer :show_id
    end
  end
end
