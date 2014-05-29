class User < ActiveRecord::Base

	has_many :users_products
	has_many :products, through: :users_products

  #adding omniauth code for user sign-in from RailsCast
  def self.from_omniauth(auth)

    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.location = auth.info.location
      user.image = auth.info.image
      user.full_name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

  def add_venmo(code)
    response = Typhoeus.post("https://api.venmo.com/v1/oauth/access_token", params: { client_id: ENV['VENMO_CLIENT_ID'], code: code, client_secret: ENV['VENMO_CLIENT_SECRET']})
    response_parsed = JSON.parse(response.body)

    # TODO: handle error response
    # if error message in response
    # => return "no go"
    # else
    # run the next chunk of code and return "venmo added"

    token = response_parsed['access_token']
    expiry = DateTime.now + 60.days
    token_type = response_parsed['token_type']
    refresh = response_parsed['refresh_token']
    venmo_id = response_parsed['user']['id']
    venmo_email = response_parsed['user']['email']

    self.update(venmo_access_token: token, venmo_expires_at: expiry, venmo_token_type: token_type, venmo_refresh_token: refresh, venmo_id: venmo_id,  venmo_email: venmo_email)
  end

  def facebook
    @facebook ||= Koala::Facebook::API.new(oauth_token)
  end

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

  def my_sales
  end


end


