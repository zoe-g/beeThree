class User < ActiveRecord::Base

	has_many :users_products
	has_many :products, through: :users_products

end
