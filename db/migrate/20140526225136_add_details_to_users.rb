class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :location, :string
    add_column :users, :image, :string
  end
end
