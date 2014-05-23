class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :product_statuses do |t|
      t.string :name

      t.timestamps
    end
  end
end
