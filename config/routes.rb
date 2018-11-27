Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :venues, only: [:show, :index, :edit, :update]

  resources :cities, only: [:show,:index] do
    resources :shows, only: [:show,:index, :new]
    # resources :venues, only: [:show,:index]
  end

  resources :cities, only: [:show,:index] do

    resources :venues, only: [:show,:index]
  end

  resources :artists, only: [:show,:index]
  resources :shows do
    resources :venues, only: [:show]
  end

  # resources :users, only: [:new,:create, :show]

  get '/cities/:city_id/shows/:show_id/:direction' => 'cities#next_show'

  get '/login' => 'sessions#login'
  post '/login' => 'sessions#login'
  get '/logout' => 'sessions#logout'
  # get '/auth/google' => 'sessions#create'
  get '/auth/google_oauth2/callback' => 'sessions#create'


  get 'search' => 'main#search', as: 'search'

  root to: "shows#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
