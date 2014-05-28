class UsersProducts < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  belongs_to :role
  belongs_to :txn_status

  # identify mirror transaction (buyer for seller, seller for buyer)
	def transact_with
		cancelled = TxnStatus.find_by(name: 'Sale Cancelled')
		mirror_transaction = UsersProducts.where(product_id: self.product_id).where.not(role_id: self.role_id).where.not(txn_status_id: cancelled.id).first
		# TODO: make the user lookup separate from this model for status_updates on txns
	end

	def seller?
		seller = Role.find_by(name: 'Seller')
		if self.role_id == seller.id
			return true
		else
			return false
		end
	end

	def visible_status
		# if user is seller, and the transaction status is...
		if self.seller? && self.txn_status.open?
			return 'Listed'
		elsif self.seller? && self.txn_status.pending?
			return 'Purchase Offer'
		elsif self.seller? && self.txn_status.payment?
			return 'Pending Payment'
		elsif self.seller? && self.txn_status.complete?
				return 'Sold'

		# if user is buyer and transaction status is...
		elsif !self.seller? && self.txn_status.pending?
			return 'Requested'
		elsif !self.seller? && self.txn_status.cancelled?
			return 'Offer Declined'
		elsif !self.seller? && self.txn_status.payment?
			return 'Waiting for Your Payment'
		elsif !self.seller? && self.txn_status.complete?
			return 'Purchased'
		else
			return txn_status.name
		end
	end

	def status_preposition
		if self.txn_status.pending? || (self.seller? && self.txn_status.payment?) || (!self.seller? && self.txn_status.complete?)
			return 'from'
		elsif (self.seller? && self.txn_status.complete?) || (!self.seller? && self.txn_status.payment?)
			return 'to'
		elsif (!self.seller? && self.txn_status.cancelled?)
			return 'by'
		else
			return ''
		end
	end

end
