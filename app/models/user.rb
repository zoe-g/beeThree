class User < ActiveRecord::Base

	has_many :users_products
	has_many :products, through: :users_products

  #adding omniauth code for user sign-in from RailsCast
  def self.from_omniauth(auth)
puts auth

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
end

