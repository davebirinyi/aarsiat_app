class Guest < ApplicationRecord
  before_save { email.downcase! }
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :saturday_adults, presence: true
  validates :saturday_children, presence: true
  # validates :vegan, presence: true
  # validates :food_restrictions, presence: true
  validates :friday_adults, presence: true
  validates :friday_children, presence: true
  validates :yoga_early, presence: true
  validates :yoga_late, presence: true
end
