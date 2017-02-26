class AddSongRequestsToGuests < ActiveRecord::Migration[5.0]
  def change
    add_column :guests, :song_requests, :string
  end
end
