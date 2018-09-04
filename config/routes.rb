Rails.application.routes.draw do
  resources :venues
  resources :cities
  resources :artists
  resources :shows
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
