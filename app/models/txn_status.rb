class TxnStatus < ActiveRecord::Base

	def open
		self.find_by(name: 'Listed').id
	end

	def open?
		if self.name == 'Listed'
			return true
		else
			return false
		end
	end

	def pending
		TxnStatus.find_by(name: 'Sale Pending').id
	end

	def pending?
		if self.name == 'Sale Pending'
			return true
		else
			return false
		end
	end

	def cancelled
		TxnStatus.find_by(name: 'Cancelled').id
	end

	def cancelled?
		if self.name == 'Sale Cancelled'
			return true
		else
			return false
		end
	end

	def payment
		TxnStatus.find_by(name: 'Payment Pending').id
	end

	def payment?
		if self.name == 'Payment Pending'
			return true
		else
			return false
		end
	end

	def complete
		TxnStatus.find_by(name: 'Sale Complete').id
	end

	def complete?
		if self.name == 'Sale Complete'
			return true
		else
			return false
		end
	end

end
