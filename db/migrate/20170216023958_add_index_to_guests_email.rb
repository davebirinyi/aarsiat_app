class AddIndexToGuestsEmail < ActiveRecord::Migration[5.0]
  def change
    add_index :guests, :email, unique: true
  end
end
