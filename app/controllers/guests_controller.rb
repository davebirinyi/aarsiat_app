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
      redirect_to @guest
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
        :saturday_adults,
        :saturday_children,
        :vegan,
        :food_restrictions,
        :friday_adults,
        :friday_children,
        :yoga_early,
        :yoga_mid,
        :yoga_late,
        :song_requests)
    end

    # Before filters

    # Confirms a checked-in guest.
    def checked_in_guest
      unless checked_in?
        flash[:danger] = "Check for a reservation by entering your email address."
        redirect_to check_url
      end
    end

    # Confirms the correct guest.
    def correct_guest
      @guest = Guest.find(params[:id])
      redirect_to(root_url) unless current_guest?(@guest)
    end
end
