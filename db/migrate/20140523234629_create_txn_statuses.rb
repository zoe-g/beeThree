class CreateTxnStatuses < ActiveRecord::Migration
  def change
    create_table :txn_statuses do |t|
      t.string :name

      t.timestamps
    end
  end
end
