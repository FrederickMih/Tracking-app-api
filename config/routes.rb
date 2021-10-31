Rails.application.routes.draw do
      post 'auth/login', to: 'authentication#create'
      post 'signup', to: 'users#create'
      resources :users
      resources :measurements, only: [:index, :create]
      get 'measurements/:id' => 'measurements#show'
      resources :measures, only: [:create, :update, :show] 
    end
 