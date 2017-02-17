require 'test_helper'

class GuestsResponseTest < ActionDispatch::IntegrationTest
  test "invalid rsvp information" do
    get rsvp_path
    assert_no_difference 'Guest.count' do
      post guests_path, params: { guest: { name:  "",
                                         email: "guest@invalid",
                                         saturday_adults: "" } }
    end
    assert_template 'guests/new'
  end

  test "valid rsvp information" do
    get rsvp_path
    assert_difference 'Guest.count', 1 do
      post guests_path, params: { guest: {  name:  "Example Guest",
                                            email: "guest@wedding.com",
                                            saturday_adults: 1,
                                            saturday_children: 1,
                                            vegan: false,
                                            food_restrictions: "",
                                            friday_adults: 0,
                                            friday_children: 0,
                                            yoga_early: 0,
                                            yoga_late: 0 } }
    end
    follow_redirect!
    assert_template 'guests/show'
    assert is_checked_in?
  end
end
