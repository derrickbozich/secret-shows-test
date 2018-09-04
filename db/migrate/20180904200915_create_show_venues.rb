class CreateShowVenues < ActiveRecord::Migration[5.2]
  def change
    create_table :show_venues do |t|
      t.integer :show_id
      t.integer :venue_id
    end
  end
end
