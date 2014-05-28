Rails.application.routes.draw do

  root to: 'users#new'
  resources :products
  resources :users, only: [:index, :show, :create, :update, :new]

  #facebook login
  match 'auth/:provider/callback', to: 'sessions#create', via: 'get'
  match 'auth/failure', to: redirect('/'), via: 'get'
  match 'signout', to: 'sessions#destroy', as: 'signout', via: 'get'

  #transaction flow
  post 'purchase/:id', to: 'users_products#buyer_purchase_intent', as: 'purchase'
  post 'accept/:id', to: 'users_products#seller_accept_offer', as: 'accept'
  post 'decline/:id', to: 'users_products#seller_decline_offer', as: 'decline'

	#venmo webhook auth (temp)
	get 'webhook_url', to: 'users#webhook_verify'
  
end
