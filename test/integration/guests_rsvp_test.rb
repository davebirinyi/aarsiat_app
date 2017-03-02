require 'test_helper'

class GuestsResponseTest < ActionDispatch::IntegrationTest
  test "invalid rsvp information" do
    get rsvp_path
    assert_no_difference 'Guest.count' do
      post guests_path, params: { guest: { name:  "",
                                         email: "guest@invalid",
                                         members_in_party: "" } }
    end
    assert_template 'guests/new'
  end

  test "valid rsvp information" do
    get rsvp_path
    assert_difference 'Guest.count', 1 do
      post guests_path, params: { guest: {  name:  "Example Guest",
                                            email: "guest@wedding.com",
                                            members_in_party: 1 } }
    end
    follow_redirect!
    assert_template 'guests/show'
    assert is_checked_in?
  end
end
