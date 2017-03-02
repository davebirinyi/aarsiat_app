class GuestsController < ApplicationController

  before_action :checked_in_guest, only: [:show, :edit, :update, :destroy]
  before_action :correct_guest,    only: [:show, :edit, :destroy]

  def index
    @guests = Guest.all
    @attendees = Attendee.all

    respond_to do |format|
      format.html
      format.csv { send_data @guests.to_csv, filename: "guests-#{Date.today}.csv" }
    end
  end

  def show
    @guest = Guest.find(params[:id])
    @attendees = @guest.attendees
    @songs = @guest.songs
  end

  def new
    @guest = Guest.new

    # @attendee_card = []
    6.times do
      @guest.attendees.build
    end

    3.times do
      @guest.songs.build
    end
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
      flash[:success] = "Update successful"
      redirect_to @guest
    else
      render 'edit'
    end
  end

  def destroy
    Guest.find(params[:id]).destroy
    flash[:success] = "Guest deleted"
    redirect_to rsvp_url
  end

  private

    def guest_params
      params.require(:guest).permit(
        :name,
        :email,
        attendees_attributes: [
          :id,
          :name,
          :child,
          :welcome_dinner,
          :yoga,
          :reception_dinner,
          :vegan,
          :food_restrictions
        ],
        songs_attributes: [
          :id,
          :artist,
          :title
        ])
    end

    # Before filters

    # Confirms the correct guest.
    def correct_guest
      @guest = Guest.find(params[:id])
      redirect_to(root_url) unless current_guest?(@guest)
    end
end
