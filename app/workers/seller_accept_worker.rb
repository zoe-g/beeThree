class SellerAcceptWorker
   include Sidekiq::Worker

  def perform(email, name)
    BeeThreeMailer.seller_accept(email, name).deliver
  end

end