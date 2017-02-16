module SessionsHelper
  # Looks up the given guest.
  def lookup(guest)
    session[:guest_id] = guest.id
  end

  # Returns the current checked-in guest (if any).
  def current_guest
    @current_guest ||= Guest.find_by(id: session[:guest_id])
  end

  # Returns true if the guest is logged in (checked in), false otherwise.
  def checked_in?
    !current_guest.nil?
  end
end
