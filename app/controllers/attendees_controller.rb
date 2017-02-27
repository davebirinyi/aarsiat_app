class AttendeesController < ApplicationController
  before_action :checked_in_guest, only: [:create, :edit, :update, :destroy]

  def create
  end

  def destroy
  end
end
