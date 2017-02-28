class RemoveMembersInPartyFromGuests < ActiveRecord::Migration[5.0]
  def change
    remove_column :guests, :members_in_party, :integer
  end
end
