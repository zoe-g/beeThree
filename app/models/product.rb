class Product < ActiveRecord::Base
  has_many :users, through: :users_products
  belongs_to :status

  validates :name, presence: true, length: {minimum: 2, maximum: 50}
  validates :description, presence: true, length: {minimum: 2, maximum: 200}
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than: 3000 }
  # Validate the attached image is image/jpg, image/png, etc
  #validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

# This method associates the attribute ":avatar" with a file attachment
  has_attached_file :avatar, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }
end
