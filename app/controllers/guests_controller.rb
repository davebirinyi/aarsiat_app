class GuestsController < ApplicationController

  def show
    @guest = Guest.find(params[:id])
  end

  def new
    @guest = Guest.new
  end
end
