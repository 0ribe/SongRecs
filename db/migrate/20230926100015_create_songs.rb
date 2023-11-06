class CreateSongs < ActiveRecord::Migration[6.1]
  def change
    create_table :songs do |t|
      t.string :tile
      t.string :name
      t.string :about
      t.date :day
      t.integer :user_id

      t.timestamps
    end
  end
end
