Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  devise_for :users
  resources :movies
  resources :theaters
  resources :shows do
    resources :bookings
  end
  post "checkout/create", to: "checkout#create"

  get "success", to: "checkout#success"
  get "failure", to: "checkout#failure"

  root "pages#home"
  get '/pages', to: "pages#home"
end
