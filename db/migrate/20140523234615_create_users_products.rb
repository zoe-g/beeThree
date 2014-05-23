class CreateUsersProducts < ActiveRecord::Migration
  def change
    create_table :users_products do |t|
      t.references :user, index: true
      t.references :product, index: true
      t.references :role, index: true
      t.references :txn_status, index: true

      t.timestamps
    end
  end
end
