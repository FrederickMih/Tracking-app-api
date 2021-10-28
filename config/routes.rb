Rails.application.routes.draw do
   namespace :api do
    namespace :v1 do  
      resources :measurements, only: [:index, :create]
      get 'measurements/:id' => 'measurements#show'
      resources :measures 
    end
  end
end