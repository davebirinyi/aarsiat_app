require 'test_helper'

class GuestsControllerTest < ActionDispatch::IntegrationTest
  test "should get rsvp" do
    get guests_rsvp_url
    assert_response :success
  end

end
