Rails.application.routes.draw do
  root 'static_pages#savedate'
  get  'static_pages/savedate'
  get  'static_pages/home'
end
