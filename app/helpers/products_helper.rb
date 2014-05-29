module ProductsHelper

  def get_friends
    friends = self.facebook.get_connection("#{self.uid}", "friends")
    return friends
  end

  def friends_sales
    friends = self.get_friends
    for_sale = []
    seller = Role.find_by(name: 'Seller')
    open = TxnStatus.find_by(name: 'Listed')

    friends.each do |friend|
      fb_id = friend['id']
      local_friend = User.find_by(uid: fb_id)

      unless local_friend.nil?
        friend_txns = UsersProducts.where(user_id: local_friend.id).where(role_id: seller.id).where(txn_status_id: open.id)
        friend_txns.each do |sale|
          for_sale.push(sale.product)
        end
      end

    end
    return for_sale
  end

  
  
end
