class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.string :image_url
      t.references :product_status, index: true

      t.timestamps
    end
  end
end
