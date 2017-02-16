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

  private

    def guest_params
      params.require(:guest).permit(:name, :email, :saturday_adults)
    end
end
