class AddSongsToGuests < ActiveRecord::Migration[5.0]
  def change
    add_column :guests, :song_artist, :string
    add_column :guests, :song_title, :string
  end
end
