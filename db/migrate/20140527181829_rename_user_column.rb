class RenameUserColumn < ActiveRecord::Migration
  def change
    rename_column :users, :facebook_id, :uid
  end
end
