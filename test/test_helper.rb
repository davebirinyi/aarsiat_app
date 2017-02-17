ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  # Returns true if a test guest is checked in (via RSVP or reservation check).
  def is_checked_in?
    !session[:guest_id].nil?
  end

  # Log in as a particular guest.
  def check_in_as(guest)
    session[:guest_id] = guest.id
  end
end

class ActionDispatch::IntegrationTest

  # Log in as a particular guest.
  def check_in_as(guest, email: 'nevercaught@boeing.com')
    post check_path, params: { session: { email: guest.email } }
  end
end
