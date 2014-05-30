Rails.application.routes.draw do

  root to: 'products#index'
  resources :products
  resources :users, except: [:destroy]

  #facebook login
  match 'auth/:provider/callback', to: 'sessions#create', via: 'get'
  match 'auth/failure', to: redirect('/'), via: 'get'
  match 'signout', to: 'sessions#destroy', as: 'signout', via: 'get'

  #venmo access
  get 'venmo', to: 'users#venmo'
  get 'venmo_auth', to: 'users#venmo_auth'

  #transaction flow
  post 'purchase/:id', to: 'users_products#buyer_purchase_intent', as: 'purchase'
  post 'accept/:id', to: 'users_products#seller_accept_offer', as: 'accept'
  post 'decline/:id', to: 'users_products#seller_decline_offer', as: 'decline'

	#venmo webhook auth (temp)
	get 'webhook_url', to: 'users#webhook_verify'

end
