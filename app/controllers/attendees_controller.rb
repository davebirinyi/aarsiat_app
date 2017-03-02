class AttendeesController < ApplicationController
  before_action :checked_in_guest, only: [:new, :edit, :update, :destroy]

  def new
    @guest = current_guest

    1.times do
      @guest.songs.build
    end
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
    @attendee = Attendee.find(params[:id])
    @attendee.destroy
    flash[:success] = "Attendee removed"
    redirect_to request.referrer || guest_url
  end

  private

    def attendee_params
      params.require(:attendee).permit( 
        :id,
        :name,
        :child,
        :welcome_dinner,
        :yoga,
        :reception_dinner,
        :vegan,
        :food_restrictions
      )
    end
end
