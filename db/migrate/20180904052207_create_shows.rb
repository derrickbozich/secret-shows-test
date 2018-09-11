class CreateShows < ActiveRecord::Migration[5.2]
  def change
    create_table :shows do |t|
      t.string :name
      t.date :date
      t.time :time
      t.string :poster
      t.integer :user_id
      t.timestamps
    end
  end
end
