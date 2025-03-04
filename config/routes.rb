Rails.application.routes.draw do
  devise_for :users
  resources :companies, only: %i[ new edit update create]
  resources :positions
  resources :applicants, only: %i[ index new create]
  root "home#index"
end
