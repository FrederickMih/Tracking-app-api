Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do  
      resources :measurements
      get 'measurements/:id' => 'measurements#show'
    end
  end
end