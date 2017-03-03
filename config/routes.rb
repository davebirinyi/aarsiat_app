Rails.application.routes.draw do

  root   'static_pages#savedate'
  # root   'static_pages#home'
  get    '/savethedate',  to: 'static_pages#savedate'
  get    '/home',         to: 'static_pages#home'
  get    '/godzillamode'   => 'guests#index'
  get    '/guests',       to: 'guests#new'
  get    '/rsvp',         to: 'guests#new'
  post   '/rsvp',         to: 'guests#create'
  patch  '/rsvp',         to: 'guests#update'
  get    '/check',        to: 'sessions#new'
  post   '/check',        to: 'sessions#create'
  delete '/check_out',    to: 'sessions#destroy'
  resources :guests,    only: [:new, :create, :show, :edit, :update, :destroy]
  resources :attendees, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :songs,     only: [:index, :create, :update, :destroy]
end
