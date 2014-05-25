class Product < ActiveRecord::Base
  belongs_to :status

  validates :name, presence: true, length: {minimum: 2, maximum: 50}
  validates :description, presence: true, length: {minimum: 2, maximum: 200}
  validates :price, presence: true, numericality: { only_integer: true, greater_than: 0, less_than: 3000 }

end

