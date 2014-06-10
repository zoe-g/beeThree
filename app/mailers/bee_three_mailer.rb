class BeeThreeMailer < ActionMailer::Base
  
  default from: "beeThreeGA@gmail.com"

  def signup_confirmation(user)
    @user = user
    mail to: "user.email", subject: "Sign Up Confirmation"
  end

  def buyer_offer(email, name)
    @name = name
    mail to: email, subject: "beeThree - Offer Submitted!"
  end

  def seller_offer(email, name)
    @name = name
    mail to: email, subject: "beeThree - Offer Received!"
  end

  def seller_accept(email, name)
    @name = name
    mail to: email, subject: "beeThree - Offer Accepted!"
  end

  def buyer_accept(email, name)
    @name = name
    mail to: email, subject: "beeThree - Offer Confirmed!"
  end

  def seller_decline(email, name)
    @name = name
    mail to: email, subject: "beeThree - Offer Declined"
  end

end
