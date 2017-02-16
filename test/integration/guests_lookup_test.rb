require 'test_helper'

class GuestsLookupTest < ActionDispatch::IntegrationTest

  def setup
    @guest = guests(:dbcooper)
  end

  test "lookup with invalid information" do
    get lookup_path
    assert_template 'sessions/new'
    post lookup_path, params: { session: { email: "" } }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test "lookup with valid information" do
    get lookup_path
    post lookup_path, params: { session: { email: @guest.email} }
    assert_redirected_to @guest
    follow_redirect!
    assert_template 'guests/show'
    assert_select "a[href=?]", lookup_path, count: 0
    # assert_select "a[href=?]", lookup_path
    # assert_select "a[href=?]", guest_path(@guest)
  end
end
