class AddAvatarFileNameToProducts < ActiveRecord::Migration
  def change
    add_column :products, :avatar_file_name, :string
  end
end
