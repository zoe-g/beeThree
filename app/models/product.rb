class Product < ActiveRecord::Base
  belongs_to :status

  validates :name, presence: true, length: {minimum: 2, maximum: 20}
  # validates :description, presence: true length: {minimum: 2, maximum: 200}
  # validates :price, presence: true
  # validates :url, presence: true

end
