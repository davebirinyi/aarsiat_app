require 'test_helper'

class GuestsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @guest = guests(:dbcooper)
    @other_guest = guests(:dondraper)
  end
  
  # test "should get godzillamode" do
  #   get godzillamode_path
  #   assert_response :success
  # end

  test "should redirect guests to rsvp" do
    get guests_path
    assert_response :success
  end

  test "should get new" do
    get rsvp_path
    assert_response :success
  end

  test "should redirect edit when not checked in" do
    get edit_guest_path(@guest)
    assert_not flash.empty?
    assert_redirected_to check_url
  end

  test "should redirect update when not checked in" do
    patch guest_path(@guest), params: { guest: { name: @guest.name,
                                              email: @guest.email } }
    assert_not flash.empty?
    assert_redirected_to check_url
  end

  test "should redirect edit when checked in as wrong guest" do
    check_in_as(@other_guest)
    get edit_guest_path(@guest)
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect show when checked in as wrong guest" do
    check_in_as(@other_guest)
    get guest_path(@guest), params: { guest: { name: @guest.name,
                                              email: @guest.email } }
    assert flash.empty?
    assert_redirected_to root_url
  end

end
