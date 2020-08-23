Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:new, :create,]
  resources :pets, only: [:index]

end
