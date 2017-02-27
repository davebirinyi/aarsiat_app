class SessionsController < ApplicationController
  def new
  end

  def create
    guest = Guest.find_by(email: params[:session][:email].downcase)
    if guest
      # Check the guest in and redirect to guest's show page (w/ rsvp details).
      check guest
      redirect_to guest
    else
      # Three-per-em space included after "go" to hack in whitespace
      flash.now[:danger] = "Reservation not found. Is this email address 
        correctly entered? If so, perhaps you need to go 
        #{view_context.link_to('RSVP', rsvp_path)}.".html_safe
      render 'new'
    end
  end

  def destroy
    check_out
    redirect_to home_url
  end
end
