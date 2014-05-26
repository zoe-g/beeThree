Rails.application.routes.draw do

  root to: 'products#index'

  #setting up routes for facebook login based on RailsCast:
  match 'auth/:provider/callback', to: 'sessions#create', via: 'get'
  match 'auth/failure', to: redirect('/'), via: 'get'
  match 'signout', to: 'sessions#destroy', as: 'signout', via: 'delete'


  resources :products
  resources :users, only: [:show, :create, :update]
  
end
