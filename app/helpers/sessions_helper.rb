module SessionsHelper
  # Checks in the given guest.
  def check(guest)
    session[:guest_id] = guest.id
  end

  # Returns true if the given guest is the current guest.
  def current_guest?(guest)
    guest == current_guest
  end

  # Returns the current checked-in guest (if any).
  def current_guest
    @current_guest ||= Guest.find_by(id: session[:guest_id])
  end

  # Returns true if the guest is logged in (checked in), false otherwise.
  def checked_in?
    !current_guest.nil?
  end

  # Logs out the current guest.
  def check_out
    session.delete(:guest_id)
    @current_guest = nil
  end
end
