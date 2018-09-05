Rails.application.routes.draw do

  resources :venues, only: [:show,:index]

  resources :cities, only: [:show,:index] do
    resources :shows, only: [:show,:index]
    # resources :venues, only: [:show,:index]
  end

  resources :cities, only: [:show,:index] do

    resources :venues, only: [:show,:index]
  end

  resources :artists, only: [:show,:index]
  resources :shows
  resources :users, only: [:new,:create]
  get '/login' => 'sessions#login'
  post '/login' => 'sessions#login'
  get '/logout' => 'sessions#logout'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
