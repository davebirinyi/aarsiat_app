class Guest < ApplicationRecord
  before_save { email.downcase! }
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :members_in_party, presence: true, only_integer: true


  def self.to_csv
    attributes = %w{ name email saturday_adults saturday_children vegan food_restrictions friday_adults friday_children yoga_early yoga_late updated_at}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |guest|
        csv << attributes.map{ |attr| guest.send(attr) }
      end
    end
  end

end
