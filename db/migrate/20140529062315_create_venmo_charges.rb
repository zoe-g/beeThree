class CreateVenmoCharges < ActiveRecord::Migration
  def change
    create_table :venmo_charges do |t|
    	t.string :payment_id
      t.string :payment_status
      t.datetime :payment_created_at
      t.datetime :payment_completed_at
      t.references :product, index: :true

      t.timestamps
    end
  end
end
