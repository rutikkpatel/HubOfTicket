Rails.application.routes.draw do
  devise_for :users
  resources :movies
  resources :theaters
  resources :shows do
    resources :bookings
  end
  post "checkout/create", to: "checkout#create"

  root "pages#home"
  get '/pages', to: "pages#home"
end