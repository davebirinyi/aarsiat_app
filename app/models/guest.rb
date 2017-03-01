class Guest < ApplicationRecord
  has_many :attendees
  accepts_nested_attributes_for :attendees, 
    reject_if: lambda {|attributes| attributes['name'].blank?}
  before_save { email.downcase! }
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :song_artist, length: { maximum: 51 }
  validates :song_title, length: { maximum: 481 }


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
