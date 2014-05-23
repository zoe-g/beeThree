class UsersProducts < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  belongs_to :role
  belongs_to :txn_status
end
