Rails.application.routes.draw do
      resources :users, only: [:create, :index]
      resources :measurements, only: [:index, :create]
      get 'measurements/:id' => 'measurements#show'
      resources :measures 
    end
 