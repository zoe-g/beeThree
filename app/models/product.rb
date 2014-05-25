class Product < ActiveRecord::Base
  has_many :users, through: :users_products
  belongs_to :status

  validates :name, presence: true, length: {minimum: 2, maximum: 50}
  validates :description, presence: true, length: {minimum: 2, maximum: 200}
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than: 3000 }

end
