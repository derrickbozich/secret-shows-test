class CreateShowArtist < ActiveRecord::Migration[5.2]
  def change
    create_table :show_artists do |t|
      t.integer :show_id
      t.integer :artist_id
    end
  end
end
