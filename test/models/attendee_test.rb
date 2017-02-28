require 'test_helper'

class AttendeeTest < ActiveSupport::TestCase

  def setup
    @guest = guests(:dbcooper)
    @attendee = @guest.attendees.build( name: "DB Cooper", 
                                        child: false,
                                        welcome_dinner: true,
                                        yoga: "7am",
                                        reception_dinner: true,
                                        vegan: false,
                                        food_restrictions: "Bourbon + soda, please",
                                        song_artist: "The Kingsmen",
                                        song_title: "Louie Louie")
  end

  test "should be valid" do
    assert @attendee.valid?
  end

end
