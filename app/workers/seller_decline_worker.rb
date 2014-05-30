class SellerDeclineWorker
   include Sidekiq::Worker

  def perform(email, name)
    BeeThreeMailer.seller_decline(email, name).deliver
  end

end