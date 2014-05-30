class BeeThreeMailer < ActionMailer::Base
  
  default from: "beeThreeGA@gmail.com"

  def signup_confirmation(user)
    @user = user
    mail to: "user.email", subject: "Sign Up Confirmation"
  end

  def buyer_offer(email, name)
    @name = name
    mail to: email, subject: "beeThree - Offer submitted!"
  end

  def seller_offer(email, name)
    @name = name
    mail to: email, subject: "beeThree - Offer submitted!"
  end

  def seller_accept(email, name)
    @name = name
    mail to: email, subject: "beeThree - Offer Accept!"
  end

end
