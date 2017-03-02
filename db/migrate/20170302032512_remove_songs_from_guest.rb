class RemoveSongsFromGuest < ActiveRecord::Migration[5.0]
  def change
    remove_column :guests, :song_artist, :string
    remove_column :guests, :song_title, :string
  end
end
