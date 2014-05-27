class UsersController < ApplicationController
	
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

end
