class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def savedate
  end

  def home
  end

  private

    # Confirms a checked-in guest.
    def checked_in_guest
      unless checked_in?
        flash[:danger] = "Check for a reservation by entering your email address."
        redirect_to check_url
      end
    end

end
