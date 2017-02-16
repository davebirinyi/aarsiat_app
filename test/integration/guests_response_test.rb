require 'test_helper'

class GuestsResponseTest < ActionDispatch::IntegrationTest
  test "invalid response information" do
    get rsvp_path
    assert_no_difference 'Guest.count' do
      post guests_path, params: { guest: { name:  "",
                                         email: "guest@invalid",
                                         password:              "foo",
                                         password_confirmation: "bar" } }
    end
    assert_template 'guests/new'
  end
end
