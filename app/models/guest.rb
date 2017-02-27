class Guest < ApplicationRecord
  has_many :attendees
  before_save { email.downcase! }
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :members_in_party, presence: true, numericality: { only_integer: true }


  def self.to_csv
    attributes = %w{ name email members_in_party updated_at}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |guest|
        csv << attributes.map{ |attr| guest.send(attr) }
      end
    end
  end

end
