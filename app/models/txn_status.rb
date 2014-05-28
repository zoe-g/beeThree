class TxnStatus < ActiveRecord::Base

	def open?
		if self.name == 'Listed'
			return true
		else
			return false
		end
	end

	def pending?
		if self.name == 'Sale Pending'
			return true
		else
			return false
		end
	end

	def cancelled?
		if self.name == 'Sale Cancelled'
			return true
		else
			return false
		end
	end

	def payment?
		if self.name == 'Payment Pending'
			return true
		else
			return false
		end
	end

	def complete?
		if self.name == 'Sale Complete'
			return true
		else
			return false
		end
	end

end
