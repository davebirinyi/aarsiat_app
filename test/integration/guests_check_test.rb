require 'test_helper'

class GuestsCheckTest < ActionDispatch::IntegrationTest
  include ApplicationHelper

  def setup
    @guest = guests(:dbcooper)
    @attendee = attendees(:dbc)
  end

  test "check (in) with invalid information" do
    get check_path
    assert_template 'sessions/new'
    post check_path, params: { session: { email: "" } }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test "check (in) with valid information followed by check out" do
    get check_path
    post check_path, params: { session: { email: @guest.email} }
    assert is_checked_in?
    assert_redirected_to @guest
    follow_redirect!
    assert_template 'guests/show'
    assert_select "a[href=?]", check_path, count: 1
    assert_select "a[href=?]", check_out_path
    assert_select "a[href=?]", guest_path(@guest)
    delete check_out_path
    assert_not is_checked_in?
    assert_redirected_to root_url
    follow_redirect!
    assert_select "a[href=?]", rsvp_path
    assert_select "a[href=?]", guest_path(@guest), count: 0
  end
end
