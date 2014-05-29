class UsersController < ApplicationController
	
	def index
		redirect_to user_path(@current_user.id)
	end

	def show
		@all_transactions = UsersProducts.where(user_id: params[:id])
	end

	def new
  	# after successful signup/login, redirect_to venmo_path
  end

	def create
	end

	def update
	end

  def venmo
  end

  def venmo_auth
  	if (params['error'] != nil) || (params['state'] != 'b3b3b3')
  		redirect_to venmo_path, notice: 'We were not able to connect to your Venmo account which is required for the use of beeThree. We require this so we can facilitate your purchases with friends. Please try again.'
  	else
	  	code = params['code']
	  	@current_user.add_venmo(code)
	  	#TODO: check response from user method that token was successfully saved
	  	redirect_to products_path, notice: "You're all set to shop!"
	  end
  end

  #venmo webhook auth (temp)
  def webhook_verify
  	render :text => params[:venmo_challenge].to_s
  end

end
