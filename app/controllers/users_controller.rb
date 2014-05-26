class UsersController < ApplicationController
	
	def show
		@all_transactions = UsersProducts.where(user_id: params[:id])
	end

	def create
	end

	def update
	end

end
