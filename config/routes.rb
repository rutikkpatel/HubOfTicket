Rails.application.routes.draw do
  get 'bookings/index'
  get 'bookings/new'
  get 'bookings/show'
  get 'bookings/edit'
  get 'seats/index'
  get 'seats/new'
  get 'seats/show'
  get 'seats/edit'
  get 'shows/index'
  get 'shows/new'
  get 'shows/show'
  get 'shows/edit'
  devise_for :users

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :movies
  resources :theaters
  resources :screens
  resources :seats
  resources :shows
  resources :bookings

  root "pages#home"
  get '/pages', to: "pages#home"
end
