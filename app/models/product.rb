class Product < ActiveRecord::Base

  has_many :users, through: :users_products
  belongs_to :status

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  # validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  validates :name, presence: true, length: {minimum: 2, maximum: 50}
  validates :description, presence: true, length: {minimum: 2, maximum: 200}
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than: 3000 }

  def seller
  	seller_role = Role.find_by(name: 'Seller')
  	seller_txn = UsersProducts.where(product_id: self.id).where(role_id: seller_role.id).first
  	seller = seller_txn.user
  end

end
