class UsersController < ApplicationController
	
	def show
		@sell_transactions = UsersProducts.where(user_id: params[:id]).where(role_id: 1)
		# @buyers = @sell_transactions.products

		@buy_transactions = UsersProducts.where(user_id: params[:id]).where(role_id: 2)

	end

	def create
	end

	def update
	end

end
