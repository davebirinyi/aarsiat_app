class AttendeesController < ApplicationController
  # before_action :checked_in_guest, only: [:new, :create, :edit, :update, :destroy]

  def new
    @guest = current_guest

    1.times do
      @guest.songs.build
    end
  end

  def create
    # @guest = current_guest
    # @attendee = current_guest.attendees.build(attendee_params)
    # if @attendee.save
    #   flash[:success] = "Attendees added"
    #   redirect_to @guest
    # else
    #   render @guest
    # end
  end

  def edit
  end

  def update
  end

  def destroy
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
