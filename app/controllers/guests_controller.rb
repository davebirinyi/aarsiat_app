class GuestsController < ApplicationController

  before_action :checked_in_guest, only: [:show, :edit, :update]
  before_action :correct_guest,    only: [:show, :edit]

  def index
    @guests = Guest.all

    respond_to do |format|
      format.html
      format.csv { send_data @guests.to_csv, filename: "guests-#{Date.today}.csv" }
    end
  end

  def show
    @guest = Guest.find(params[:id])
  end

  def new
    @guest = Guest.new
  end

  def create
    @guest = Guest.new(guest_params)
    if @guest.save
      check @guest
      flash[:success] = "Thanks for your response!"
      redirect_to @guest #ONCE ATTENDEES FORM READY, BOOT TO THERE
    else
      render 'new'
    end
  end

  def edit
    # @guest = Guest.find(params[:id])
  end

  def update
    @guest = current_guest # WATCH OUT FOR THIS CHEEKY FUCKER
    if @guest.update_attributes(guest_params)
      flash[:success] = "Reservation updated"
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
        :members_in_party)
    end

    # Before filters

    # Confirms the correct guest.
    def correct_guest
      @guest = Guest.find(params[:id])
      redirect_to(root_url) unless current_guest?(@guest)
    end
end
