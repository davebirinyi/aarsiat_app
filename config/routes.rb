Rails.application.routes.draw do
  get 'static_pages/home'

  get 'static_pages/savedate'

  root 'application#savedate'
end
