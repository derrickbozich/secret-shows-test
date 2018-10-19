Rails.application.routes.draw do

  resources :venues, only: [:show, :index, :edit, :update]

  resources :cities, only: [:show,:index] do
    resources :shows, only: [:show,:index]
    # resources :venues, only: [:show,:index]
  end

  resources :cities, only: [:show,:index] do

    resources :venues, only: [:show,:index]
  end

  resources :artists, only: [:show,:index]
  resources :shows do
    resources :venues, only: [:show]
  end
  resources :users, only: [:new,:create, :show]
  get '/login' => 'sessions#login'
  post '/login' => 'sessions#login'
  get '/logout' => 'sessions#logout'
  get '/auth/facebook/callback' => 'sessions#create'


  get 'search' => 'main#search', as: 'search'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
