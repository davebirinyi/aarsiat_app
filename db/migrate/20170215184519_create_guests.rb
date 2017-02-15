class CreateGuests < ActiveRecord::Migration[5.0]
  def change
    create_table :guests do |t|
      t.string :name
      t.string :email
      t.integer :saturday_adults
      t.integer :saturday_children
      t.boolean :vegan
      t.string :food_restrictions
      t.integer :friday_adults
      t.integer :friday_children
      t.integer :yoga_early
      t.integer :yoga_late

      t.timestamps
    end
  end
end
