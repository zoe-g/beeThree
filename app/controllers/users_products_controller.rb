class UsersProductsController < ApplicationController
	respond_to :json

	def buyer_purchase_intent
		pending = TxnStatus.find_by(name: 'Sale Pending')

    buyer = Role.find_by(name: 'Buyer')
		buyer_txn = UsersProducts.create(user_id: @current_user.id, product_id: params[:id], role_id: buyer.id, txn_status_id: pending.id)
		seller_txn = buyer_txn.transact_with
		seller_txn.update(txn_status_id: pending.id)

		# TODO: kick-off sidekiq worker sending email to seller!

		redirect_to users_path, notice: "We'll let #{seller_txn.user.first_name} know you're ready to buy this #{seller_txn.product.name}. Keep an eye out for an email from us once #{seller_txn.user.first_name} confirms."
	end

	def seller_accept_offer
		payment = TxnStatus.find_by(name: 'Payment Pending')

		seller_txn = UsersProducts.find(params[:id])
		seller_txn.update(txn_status_id: payment.id)

		buyer_txn = seller_txn.transact_with
		buyer_txn.update(txn_status_id: payment.id)

		# TODO: trigger venmo charge!
		# TODO: kick-off sidekiq worker sending email to buyer

		redirect_to users_path, notice: "Sold! We've sent a Venmo charge to #{buyer_txn.user.first_name}. Please get in touch with them about delivering #{seller_txn.product.name}."
	end

	def seller_decline_offer
		open = TxnStatus.find_by(name: 'Listed')
		cancelled = TxnStatus.find_by(name: 'Sale Cancelled')

		binding.pry
		seller_txn = UsersProducts.find(params[:id])
		seller_txn.update(txn_status_id: open.id)
<<<<<<< HEAD

=======
		binding.pry
		#need a more direct way of getting this from the json request of which txn.id they're declining? could be more than one buyer_txn in pending state
>>>>>>> b18688bae850330cc957abe51505586a4e827c5d
		buyer_txn = seller_txn.transact_with
		buyer_txn.update(txn_status_id: cancelled.id)

		# TODO: kick-off sidekiq worker sending email to buyer

		redirect_to users_path, notice: "We'll let #{buyer_txn.user.first_name} know. In the meantime, #{seller_txn.product.name} is back on the market."
	end

	def venmo_confirm_payment
		# TODO: Ensure payment webhooks are coming through and being read/assigned properly
		# TODO: Figure out how to identify buyer/seller transactions from the venmo webhook

		complete = TxnStatus.find_by(name: 'Sale Complete')

		seller_txn.update(txn_status_id: complete.id)
		buyer_txn.update(txn_status_id: complete.id)

	end

end
