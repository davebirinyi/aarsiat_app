class CreateAttendees < ActiveRecord::Migration[5.0]
  def change
    create_table :attendees do |t|
      t.string :name
      t.boolean :child
      t.boolean :welcome_dinner
      t.string :yoga
      t.boolean :reception_dinner
      t.boolean :vegan
      t.string :food_restrictions
      t.string :song_artist
      t.string :song_title
      t.references :guest, foreign_key: true

      t.timestamps
    end
    add_index :attendees, [:guest_id, :updated_at]
  end
end
