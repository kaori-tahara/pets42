Rails.application.routes.draw do
  devise_for :users
  root to: 'pets#index'
  resources :users, only: [:new, :create]
  resources :pets, only: :index

  resources :jobs do
    resources :negotiations
  end

  resources :cravings do
    resources :negotiations
  end


end
