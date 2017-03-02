class RemoveAttendeeInfoFromGuests < ActiveRecord::Migration[5.0]
  def change
    remove_column :guests, :saturday_adults, :integer
    remove_column :guests, :saturday_children, :integer
    remove_column :guests, :vegan, :boolean
    remove_column :guests, :food_restrictions, :string
    remove_column :guests, :friday_adults, :integer
    remove_column :guests, :friday_children, :integer
    remove_column :guests, :yoga_early, :integer
    remove_column :guests, :yoga_late, :integer
    remove_column :guests, :yoga_mid, :integer
    remove_column :guests, :song_requests, :string
  end
end
