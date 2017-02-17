class GuestsController < ApplicationController

  def show
    @guest = Guest.find(params[:id])
  end

  def new
    @guest = Guest.new
  end

  def create
    @guest = Guest.new(guest_params)
    if @guest.save
      check @guest   # check reservation / check in
      flash[:success] = "Thanks for your response!"
      redirect_to @guest
    else
      render 'new'
    end
  end

  def edit
    @guest = Guest.find(params[:id])
  end

  def update
    @guest = current_guest # WATCH OUT FOR THIS CHEEKY FUCKER
    if @guest.update_attributes(guest_params)
      flash[:success] = "Profile updated"
      redirect_to @guest
    else
      render 'edit'
    end
  end

  private

    def guest_params
      params.require(:guest).permit(
        :name,
        :email,
        :saturday_adults,
        :saturday_children,
        :vegan,
        :food_restrictions,
        :friday_adults,
        :friday_children,
        :yoga_early,
        :yoga_late)
    end
end
