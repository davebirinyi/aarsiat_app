Rails.application.routes.draw do

  # root   'static_pages#savedate'
  root   'static_pages#home'
  get    '/savedate',  to: 'static_pages#savedate'
  get    '/home',      to: 'static_pages#home'
  get    '/rsvp',      to: 'guests#new'
  post   '/rsvp',      to: 'guests#create'
  patch  '/rsvp',      to: 'guests#update'
  get    '/check',     to: 'sessions#new'
  post   '/check',     to: 'sessions#create'
  delete '/check_out',  to: 'sessions#destroy'
  resources :guests
end
