class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def savedate
  end

  def home
  end

end
