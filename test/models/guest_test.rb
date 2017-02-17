require 'test_helper'

class GuestTest < ActiveSupport::TestCase

  def setup
    @guest = Guest.new(
      name: "Example Guest", 
      email: "guest@thewedding.com",
      saturday_adults: 1,
      saturday_children: 1,
      vegan: false,
      food_restrictions: "",
      friday_adults: 0,
      friday_children: 0,
      yoga_early: 0,
      yoga_late: 0)
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
    assert_not @guest.valid?
  end

  test "saturday_adults should be present" do
    @guest.saturday_adults = " "
    assert_not @guest.valid?
  end

  test "name should not be too long" do
    @guest.name = "a" * 51
    assert_not @guest.valid?
  end

  test "email should not be too long" do
    @guest.email = "a" * 244 + "@thewedding.com"
    assert_not @guest.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @guest.email = valid_address
      assert @guest.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @guest.email = invalid_address
      assert_not @guest.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email addresses should be unique" do
    duplicate_guest = @guest.dup
    duplicate_guest.email = @guest.email.upcase
    @guest.save
    assert_not duplicate_guest.valid?
  end

  test "email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @guest.email = mixed_case_email
    @guest.save
    assert_equal mixed_case_email.downcase, @guest.reload.email
  end
end
