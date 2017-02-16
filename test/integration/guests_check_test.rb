require 'test_helper'

class GuestsCheckTest < ActionDispatch::IntegrationTest

  def setup
    @guest = guests(:dbcooper)
  end

  test "check with invalid information" do
    get check_path
    assert_template 'sessions/new'
    post check_path, params: { session: { email: "" } }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test "check with valid information" do
    get check_path
    post check_path, params: { session: { email: @guest.email} }
    assert_redirected_to @guest
    follow_redirect!
    assert_template 'guests/show'
    assert_select "a[href=?]", check_path, count: 0
    # assert_select "a[href=?]", check_out_path # not sure where to place
    # assert_select "a[href=?]", guest_path(@guest) #ditto
  end
end
