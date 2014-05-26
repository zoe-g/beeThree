Rails.application.routes.draw do

  root to: 'products#index'
  resources :products
  resources :users, only: [:show, :create, :update]
  
end
