class GuestsController < ApplicationController

  def show
    @guest = Guest.find(params[:id])
  end

  def new
    @guest = Guest.new
  end

  def create
    @guest = Guest.new(params[:guest])    # Not the final implementation!
    if @guest.save
      # Handle a successful save.
    else
      render 'new'
    end
  end

  private

    def guest_params
      params.require(:guest).permit(:name, :email, :saturday_adults)
    end
end
