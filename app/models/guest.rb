class Guest < ApplicationRecord
  has_many :attendees
  has_many :songs
  accepts_nested_attributes_for :attendees, 
    reject_if: lambda {|attributes| attributes['name'].blank?}
  accepts_nested_attributes_for :songs,
    reject_if: lambda {|attributes| attributes['artist']&&['title'].blank?}
  before_save { email.downcase! }
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  def self.to_csv
    attributes = %w{ 
      guest_id
      name
      welcome_dinner
      yoga
      reception_dinner
      child
      vegan
      food_restrictions
      updated_at
    }
    guest_attributes = %w{
      email
    }

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |guest|
          # csv << guest_attributes.map{ |attr| guest.send(attr) }
        guest.attendees.each do |a|
          csv << attributes.map{ |attr| a.send(attr) }
        end
      end
    end
  end


end
