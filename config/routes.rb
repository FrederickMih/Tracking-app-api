Rails.application.routes.draw do
 resources :sessions, only: [:create]
 root to: "measurements#index"
end
