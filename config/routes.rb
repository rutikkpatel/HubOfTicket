Rails.application.routes.draw do
  devise_for :users

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :movies
  resources :theaters
  resources :shows
  resources :bookings
  resources :checkout, only: [:create]

  root "pages#home"
  get '/pages', to: "pages#home"
end
