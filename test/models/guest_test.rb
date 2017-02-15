require 'test_helper'

class GuestTest < ActiveSupport::TestCase
  
  def setup
    @guest = Guest.new(name: "Example Guest", email: "guest@annaandryansittinginatree.com")
  end

  test "should be valid" do
    assert @guest.valid?
  end

  test "name should be present" do
    @guest.name = "     "
    assert_not @guest.valid?
  end

  test "email should be present" do
    @guest.email = "     "
    assert_not @user.valid?
  end
end
