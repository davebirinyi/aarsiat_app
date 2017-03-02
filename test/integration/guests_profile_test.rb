require 'test_helper'

class GuestsProfileTest < ActionDispatch::IntegrationTest
  include ApplicationHelper

  def setup
    @guest = guests(:dbcooper)
    @attendee = attendees(:dbc)
  end

  test "profile display" do
    get check_path
    post check_path, params: { session: { email: @guest.email} }
    assert is_checked_in?
    get guest_path(@guest)
    assert_match @guest.attendees.count.to_s, response.body
    @guest.attendees.each do |attendee|
      assert_match attendee.name, response.body
    end
  end

end
