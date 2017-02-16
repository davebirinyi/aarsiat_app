require 'test_helper'

class GuestTest < ActiveSupport::TestCase

  def setup
    @guest = Guest.new(name: "Example Guest", email: "guest@thiswedding.com")
  end

  test "should be valid" do
    assert @guest.valid?
  end
end
