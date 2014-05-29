class AddVenmoFieldsToUser < ActiveRecord::Migration
  def change
  	add_column :users, :venmo_access_token, :string
  	add_column :users, :venmo_expires_at, :datetime
    add_column :users, :venmo_token_type, :string
    add_column :users, :venmo_refresh_token, :string
    add_column :users, :venmo_id, :string
    add_column :users, :venmo_email, :string
  end
end
