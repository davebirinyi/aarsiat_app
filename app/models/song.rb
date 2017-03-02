class Song < ApplicationRecord
  belongs_to :guest, optional: true
  validates :artist, length: { maximum: 51 }
  validates :title, length: { maximum: 481 }

end
