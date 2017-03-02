class SongsController < ApplicationController

  def index
    @guests = Guest.all
  end
  
  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    flash[:success] = "Song removed"
    redirect_to request.referrer || guest_url
  end
  private

    def song_params
      params.require(:attendee).permit( 
        :id,
        :artist,
        :title
      )
    end

end
