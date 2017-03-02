require 'test_helper'

class AttendeesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @attendee = attendees(:dbc)
  end

  # test "should redirect destroy when not logged in" do
  #   assert_no_difference 'Attendee.count' do
  #     delete attendee_path(@attendee)
  #   end
  #   assert_redirected_to check_url
  # end

end
