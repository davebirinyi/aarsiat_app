class SongsController < ApplicationController

  def index
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
  end

  private

    def song_params
      params.require(:attendee).permit( 
        :artist,
        :title
      )
    end

end
