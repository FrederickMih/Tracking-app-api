Rails.application.routes.draw do

  resources :registrations, only: [:create]
  resources :sessions, only: [:create]
  resource :sessions, only: [:destroy]

  resources :measurements, only: [:index, :show] do
    resources :measures, only: [:create, :update, :destroy]
  end

  resources :measures, only: [:index]
end