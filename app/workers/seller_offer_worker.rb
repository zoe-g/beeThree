class SellerOfferWorker
   include Sidekiq::Worker

  def perform(email, name)
    BeeThreeMailer.seller_offer(email, name).deliver
  end

end