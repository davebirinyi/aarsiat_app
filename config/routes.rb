Rails.application.routes.draw do
  root 'static_pages#savedate'
  get  '/savedate', to: 'static_pages#savedate'
  get  '/home',     to: 'static_pages#home'
end
