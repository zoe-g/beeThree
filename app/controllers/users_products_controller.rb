class UsersProductsController < ApplicationController
	respond_to :json
	## TODO: rewrite all so they receive POST requests from json only via JS

	def buyer_purchase_intent
		pending = TxnStatus.find_by(name: 'Sale Pending')

    buyer = Role.find_by(name: 'Buyer')
		buyer_txn = UsersProducts.create(user_id: @current_user.id, product_id: @product.id, role_id: buyer.id, txn_status_id: pending.id)

		seller_txn = buyer_txn.transact_with
		seller_txn.update(txn_status_id: pending.id)

		# TODO: kick-off sidekiq worker sending email to seller!
	end

	def seller_accept_offer
		payment = TxnStatus.find_by(name: 'Payment Pending')

		seller_txn = UsersProducts.find(params[:id])
		seller_txn.update(txn_status_id: payment.id)

		buyer_txn = seller_txn.transact_with
		buyer_txn.update(txn_status_id: payment.id)

		# TODO: trigger venmo charge!
	end

	def seller_decline_offer
		open = TxnStatus.find_by(name: 'Listed')
		cancelled = TxnStatus.find_by(name: 'Sale Cancelled')

		seller_txn = UsersProducts.find(params[:id])
		seller_txn.update(txn_status_id: open.id)

		#need a more direct way of getting this from the json request of which txn.id they're declining? could be more than one buyer_txn in pending state
		buyer_txn = seller_txn.transact_with
		buyer_txn.update(txn_status_id: cancelled.id)
	end

	def venmo_confirm_payment
		# TODO: Ensure payment webhooks are coming through and being read/assigned properly
		# TODO: Figure out how to identify buyer/seller transactions from the venmo webhook

		complete = TxnStatus.find_by(name: 'Sale Complete')

		seller_txn.update(txn_status_id: complete.id)
		buyer_txn.update(txn_status_id: complete.id)

	end

end
