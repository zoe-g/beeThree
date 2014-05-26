class AddFacebooktoUsers < ActiveRecord::Migration
  def change
    add_column :users, :provider, :string
    add_column :users, :facebook_id, :string
    add_column :users, :oauth_token, :string
    add_column :users, :oauth_expires_at, :datetime
    add_column :users, :full_name, :string
  end
end


