require 'test_helper'

class GuestsLookupTest < ActionDispatch::IntegrationTest
  test "lookup with invalid information" do
    get lookup_path
    assert_template 'sessions/new'
    post lookup_path, params: { session: { email: "" } }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end
end
