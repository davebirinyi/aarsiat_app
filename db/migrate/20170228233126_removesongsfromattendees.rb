class Removesongsfromattendees < ActiveRecord::Migration[5.0]
  def change
    remove_column :attendees, :song_artist, :string
    remove_column :attendees, :song_title, :string
  end
end
