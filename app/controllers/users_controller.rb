class UsersController < ApplicationController

  skip_before_filter :signed_in_user, only: [:new]
  
	def index
		redirect_to user_path(@current_user.id)
	end

	def show
		@all_transactions = UsersProducts.where(user_id: current_user.id)
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

end