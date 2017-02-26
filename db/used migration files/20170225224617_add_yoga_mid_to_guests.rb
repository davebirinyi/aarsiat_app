class AddYogaMidToGuests < ActiveRecord::Migration[5.0]
  def change
    add_column :guests, :yoga_mid, :integer
  end
end
