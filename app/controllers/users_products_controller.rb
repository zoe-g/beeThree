class UsersProductsController < ApplicationController
	respond_to :json

	def buyer_purchase_intent
		pending = TxnStatus.find_by(name: 'Sale Pending')

    buyer = Role.find_by(name: 'Buyer')
		buyer_txn = UsersProducts.create(user_id: @current_user.id, product_id: params[:id], role_id: buyer.id, txn_status_id: pending.id)
		seller_txn = buyer_txn.transact_with
		seller_txn.update(txn_status_id: pending.id)

		# TODO: kick-off sidekiq worker sending email to seller!

		redirect_to users_path, notice: "We'll let #{seller_txn.user.first_name} know you're ready to buy the #{seller_txn.product.name.downcase}. Keep an eye out for an email from us once #{seller_txn.user.first_name} confirms."
	end

	def seller_accept_offer
		
		# update transaction statuses
		payment = TxnStatus.find_by(name: 'Payment Pending')
		seller_txn = UsersProducts.find(params[:id])
		seller_txn.update(txn_status_id: payment.id)
		buyer_txn = seller_txn.transact_with
		buyer_txn.update(txn_status_id: payment.id)

		# send charge to buyer on behalf of seller
		venmo_params = {access_token: seller_txn.user.venmo_access_token,
								    user_id: buyer_txn.user.venmo_id,
								    note: seller_txn.product.name+' via beeThree',
								    amount: (seller_txn.product.price * -1),
								  	audience: 'friends'}
		charge = Typhoeus.post("https://api.venmo.com/v1/payments", params: venmo_params)
    charge_parsed = JSON.parse(charge.body)
    
    # save payment info in order to follow up on status later
    venmo_info = charge_parsed['data']['payment']
		new_charge = VenmoCharge.create(payment_id: venmo_info['id'], payment_status: venmo_info['status'], payment_created_at: venmo_info['date_created'].to_datetime, product_id: seller_txn.product.id)

		# TODO: kick-off sidekiq worker sending email to buyer

		redirect_to users_path, notice: "Sold! We've sent a Venmo charge to #{buyer_txn.user.first_name}. Please get in touch with them about delivering the #{seller_txn.product.name.downcase}."
	end

	def seller_decline_offer
		open = TxnStatus.find_by(name: 'Listed')
		cancelled = TxnStatus.find_by(name: 'Sale Cancelled')

		seller_txn = UsersProducts.find(params[:id])
		seller_txn.update(txn_status_id: open.id)
		
		buyer_txn = seller_txn.transact_with
		buyer_txn.update(txn_status_id: cancelled.id)

		# TODO: kick-off sidekiq worker sending email to buyer

		redirect_to users_path, notice: "We'll let #{buyer_txn.user.first_name} know. In the meantime, your #{seller_txn.product.name.downcase} is back on the market."
	end

	def venmo_confirm_payment
		# TODO: currently incomplete
		# Ensure payment webhooks are coming through and being read/assigned properly
		# OR implement sidetiq to check up on status. possible statuses are 'settled', 'pending', 'failed', 'expired' and 'cancelled'.

		# update charge status -- currently doesn't work -- receives a scope error (need profile access??)
		pending_charges = VenmoCharge.where(payment_status: 'pending')
		
		pending_charges.each do |charge|
			id = charge.payment_id
			token = charge.product.seller.venmo_access_token
			url = "https://api.venmo.com/v1/payments/"+id+"?access_token="+token
			update = Typhoeus.post(url)
	    update_parsed = JSON.parse(update.body)
	    new_status = update_parsed['data']['status']
	    if update_parsed['data']['date_completed'] = nil
	    	completed = nil
	    else
	    	completed = update_parsed['data']['date_completed'].to_datetime
	    end
			charge.update(payment_status: new_status, payment_completed_at: completed)
		end

		# update transaction statuses -- check for current payment status first
		complete = TxnStatus.find_by(name: 'Sale Complete')
		seller_txn.update(txn_status_id: complete.id)
		buyer_txn.update(txn_status_id: complete.id)

	end

end
