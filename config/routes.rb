Rails.application.routes.draw do

  root to: 'products#index'

  #setting up routes for facebook login based on RailsCast:
  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: redirect('/')
  match 'signout', to: 'sessions#destroy', as: 'signout'  


  resources :products
  resources :users, only: [:show, :create, :update]
  
end
