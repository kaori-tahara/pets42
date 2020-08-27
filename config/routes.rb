Rails.application.routes.draw do
  devise_for :users
  root to: 'pets#index'
  resources :users, only: [:new, :create]
  resources :pets, only: :index
  resources :jobs 


end
