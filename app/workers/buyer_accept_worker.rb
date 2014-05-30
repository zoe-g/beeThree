class BuyerAcceptWorker
   include Sidekiq::Worker

  def perform(email, name)
    BeeThreeMailer.BuyerAcceptWorker_accept(email, name).deliver
  end

end