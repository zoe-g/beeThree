class BuyerOfferWorker
   include Sidekiq::Worker

  def perform(email, name)
    BeeThreeMailer.buyer_offer(email, name).deliver
  end

end
