Rails.application.routes.draw do
      resources :measurements, only: [:index, :create]
      get 'measurements/:id' => 'measurements#show'
      resources :measures 
    end