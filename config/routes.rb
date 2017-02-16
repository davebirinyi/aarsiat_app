Rails.application.routes.draw do

  root   'static_pages#savedate'
  get    '/savedate',  to: 'static_pages#savedate'
  get    '/home',      to: 'static_pages#home'
  get    '/rsvp',      to: 'guests#new'
  post   '/rsvp',      to: 'guests#create'
  get    '/lookup',    to: 'sessions#new'
  post   '/lookup',    to: 'sessions#create'
  delete '/logout',    to: 'sessions#destroy'
  resources :guests
end
