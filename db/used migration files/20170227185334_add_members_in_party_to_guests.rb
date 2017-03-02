class AddMembersInPartyToGuests < ActiveRecord::Migration[5.0]
  def change
    add_column :guests, :members_in_party, :integer
  end
end
