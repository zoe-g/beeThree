class UsersController < ApplicationController
	
	def index
		redirect_to user_path(@current_user.id)
	end

	def show
		@all_transactions = UsersProducts.where(user_id: params[:id])
	end

	def create
	end

	def update
	end

  #venmo webhook auth (temp)
  def webhook_verify
    render :text => params[:venmo_challenge].to_s
  end

  #updated root route to user#new to allow user to sign-in/up before viewing the products#index page.
  def new
  end

  def venmo_auth
  	# only direct here if the user is already signed in with facebook
  	code = params['code']
  	@current_user.add_venmo(code)
  	# state_return = params['state']
  	# if state_return = 'b3b3b3'
  	redirect_to products_path, notice: #whatever add_venmo returned
  end

	#STEP 2  USE RESPONSE CODE AND REQUEST TOKEN
	#response is https://myexampleapp.com/oauth?code=AUTHORIZATION_CODE
	#post to https://api.venmo.com/v1/oauth/access_token?client_id=<client_id>&code=<code>&client_secret=<client_secret>

	#STEP 3  PARSE AND SAVE RESPONSE
	#parse response with access token and save necessary items in user model
	#handle error response -->



#   	response = Typhoeus.get("www.omdbapi.com", :params => { :t => "Cars", :y => "2006" })
# rubyresponse = JSON.parse(response.body)
# puts rubyresponse["Poster"]
#   	Typhoeus
#   	  response = Typhoeus.get("localhost:3000/movies.json?query=#{params[:query]}")
#   @movies = JSON.parse(response.body)

end
