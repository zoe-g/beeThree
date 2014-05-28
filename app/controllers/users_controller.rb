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

<<<<<<< HEAD
  #venmo webhook auth (temp)
  def webhook_verify
    render :text => params[:venmo_challenge].to_s
  end

=======
  def new

  end
>>>>>>> updated root route to user#new to allow user to sign-in/up before viewing the products#index page.
end
