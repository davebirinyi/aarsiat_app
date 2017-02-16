class CreateGuests < ActiveRecord::Migration[5.0]
  def change
    create_table :guests do |t|
      t.string :name
      t.string :email
      t.integer :saturday_adults 
      t.integer :saturday_children, :default => 0
      t.boolean :vegan,             :default => false
      t.string  :food_restrictions, :default => null
      t.integer :friday_adults,     :default => 0
      t.integer :friday_children,   :default => 0
      t.integer :yoga_early,        :default => 0
      t.integer :yoga_late,         :default => 0

      t.timestamps
    end
  end
end
