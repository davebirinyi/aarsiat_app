class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def savedate
    render html: "Let's go to the forest... July 8, 2017"
  end
end
