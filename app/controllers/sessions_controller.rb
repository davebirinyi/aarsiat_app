class SessionsController < ApplicationController
  def new
  end

  def create
    guest = Guest.find_by(email: params[:session][:email].downcase)
    if guest
      # Log the guest in and redirect to guest's show page (w/ rsvp details).
    else
      flash[:danger] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end

  def destroy
  end
end
