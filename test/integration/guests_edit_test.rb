require 'test_helper'

class GuestsEditTest < ActionDispatch::IntegrationTest

  def setup
    @guest = guests(:dbcooper)
  end

  test "unsuccessful edit" do
    check_in_as(@guest)
    get edit_guest_path(@guest)
    assert_template 'guests/edit'
    patch guest_path(@guest), params: { guest: { name:  "",
                                              email: "foo@invalid" } }

    assert_template 'guests/edit'
  end

  test "successful edit" do
    check_in_as(@guest)
    get edit_guest_path(@guest)
    assert_template 'guests/edit'
    name  = "Foo Bar"
    email = "foo@bar.com"
    patch guest_path(@guest), params: { guest: { name:  name,
                                              email: email } }
    assert_not flash.empty?
    assert_redirected_to @guest
    @guest.reload
    assert_equal name,  @guest.name
    assert_equal email, @guest.email
  end
end
