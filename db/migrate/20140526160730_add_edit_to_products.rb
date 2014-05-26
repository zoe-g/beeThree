class AddEditToProducts < ActiveRecord::Migration
  def change
    add_column :products, :editable, :boolean, :default => false
  end
end
