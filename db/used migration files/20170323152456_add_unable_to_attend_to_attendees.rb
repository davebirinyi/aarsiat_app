class AddUnableToAttendToAttendees < ActiveRecord::Migration[5.0]
  def change
    add_column :attendees, :unable_to_attend, :boolean
  end
end
