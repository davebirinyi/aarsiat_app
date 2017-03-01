class Attendee < ApplicationRecord
  belongs_to :guest, optional: true
  # default_scope -> { order(updated_at: :desc) }
  # validates :guest_id, presence: true
  validates :name, presence: true, length: { maximum: 50 }
  validates :child, inclusion: { in: [ true, false ] }
  validates :welcome_dinner, inclusion: { in: [ true, false ] }
  validates :yoga, inclusion: { in: [ "","7am","9am","11am" ] }
  validates :reception_dinner, inclusion: { in: [ true, false ] }
  validates :vegan, inclusion: { in: [ true, false ] }
  # validates :food_restrictions
end
