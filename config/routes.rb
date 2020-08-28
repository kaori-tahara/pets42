Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  
  root to: 'pets#index'
  resources :users, only: [:new, :create, :show, :edit]
  resources :pets, only: :index

  resources :jobs do
    resources :jobnegotiations, only: [:index,:create]
  end

  resources :cravings do
    resources :cravingnegotiations, only: [:index,:create]
  end


end
