Rails.application.routes.draw do

  root to: 'products#index'
   resources :products
  resources :users, only: [:show, :create, :update]



  #setting up routes for facebook login based on RailsCast
  match 'auth/:provider/callback', to: 'sessions#create', via: 'get'
  match 'auth/failure', to: redirect('/'), via: 'get'
  match 'signout', to: 'sessions#destroy', as: 'signout', via: 'get'

	#venmo webhook auth (temp)
	get 'webhook_url', to: 'users#webhook_verify'

#transaction controller routes

post 'decline_offer/:id', to: 'users_products#seller_decline_offer', as: 'decline'
  
end
