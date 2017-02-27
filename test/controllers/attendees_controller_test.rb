require 'test_helper'

class AttendeesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @attendee = attendees(:dbc)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Attendee.count' do
      post attendees_path, params: { attendee: { 
        name: "DB Cooper", 
        child: false,
        welcome_dinner: true,
        yoga: "7am",
        reception_dinner: true,
        vegan: false,
        food_restrictions: "Bourbon + soda, please",
        song_artist: "The Kingsmen",
        song_title: "Louie Louie" 
      } }
    end
    assert_redirected_to check_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Attendee.count' do
      delete attendee_path(@attendee)
    end
    assert_redirected_to check_url
  end

end
